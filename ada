#Test Bot by Smackoes
#22/05/2018

import discord
from discord.ext import commands
from discord.ext.commands import Bot
import asyncio
import os

"""GAME DISPLAYED"""
#GameStatus = "Offline"
#GameStatus = "H&G WAR"
#GameStatus = "H&G Staged"
#GameStatus = "Hell Let Loose"
#GameStatus = "Post Scriptum"
GameStatus = "Down for Maintenance"

"""DOMINION"""
"""WAR"""
DominionStatus = "Not Playing War"
#DominionStatus = "Playing WAR"
#DominionStatus = "Searching for WAR"
"""BATTLE"""
DomLocation = "Chaudes-Aigues"
DomPlayers = "DOM-RC-COMMUNITY vs ZF Clan | GE 17 vs US 16"
#DomPlayers = "Unknown"
DomPlayingAs = "Germany"
"""PLAYERS"""
#DomMembersPlaying = "None"
DomMembersPlaying = "Janisarry\ncat-\nNew-Zealand-Soldier\nSmackoes\nTricksho[T]\nTwofud"
"""STREAMS"""
DomStreams = "No Twitch Streams"
#DomStreams = "SamCMax"
#DomStreams = "Janisarry"
#DomLinks = "https://www.twitch.tv/samcmax"
#DomLinks = "https://www.twitch.tv/janisarry"
DomLinks = "None"

"""NOMADS"""
"""WAR"""
NomadsStatus = "Not Playing War"
#NomadsStatus = "Playing WAR"
"""BATTLE"""
NomadsLocation = "Montpellier"
NomadsPlayers = "GE 14 vs US 12"
NomadsPlayingAs = "United States"


"""COMMUNITY"""
"""WAR"""
CommunityStatus = "None Reported"
#CommunityStatus = "WAR"
"""BATTLE"""
CommunityLocation = "Montpellier"
CommunityPlayers = "GE 14 vs US 12"
CommunityPing = "80"
"""STREAMS"""
CommunityStreams = "No Twitch Streams"
#CommunityStreams = "Avmuse"
#CommunityLinks = "https://www.twitch.tv/avmuse"
CommunityLinks = "None"

"""---------------------CODE-----------------------"""

from datetime import datetime

filename = "/War Bot/WarBot.py"
statbuf = os.stat(filename).st_mtime
statbuf -= statbuf % 60

lastmodified=str(datetime.fromtimestamp(statbuf))

bot = commands.Bot(command_prefix='!')

"""BATTLE BOT"""

@bot.event
async def on_message(message):
    if message.content.lower().startswith('!q ge'):
        """message"""
        userID = message.author.id
        await bot.send_message(message.channel, "<@%s> You are queued for Germany!" % (userID))
        """action"""
        user = message.author
        role = discord.utils.get(user.server.roles, name="QueuedGE")
        await bot.add_roles(user, role)

        file = open("testfile.txt","a") 
        file.write("\n" + str(user))
        file.close() 

        gequeue =+ 1
        print(gequeue)
        
        if gequeue >= 5: 
            if gequeue == usqueue:
                await bot.send_message(message.channel, "<@&532724745612034050> Battle Ready against US!")

                file = open("testfile.txt","r") 
                for line in file: 
                    print(line)

                



    if message.content.lower().startswith('!remove ge'):
        """message"""
        userID = message.author.id
        await bot.send_message(message.channel, "<@%s> Removed from queue!" % (userID))
        """action"""
        user = message.author
        role = discord.utils.get(user.server.roles, name="QueuedGE")
        await bot.remove_roles(user, role)




"""ANY CHANGES REQUIRE REBOOT OF FILE"""

@bot.event
async def on_ready():
    print ("Ready!")
    print ("I am running on " + bot.user.name)
    print ("With the ID: " + bot.user.id)
    await bot.change_presence(game=discord.Game(name=GameStatus))    


"""EMBED CODE"""

"""DOMINION CODE WAR"""
@bot.command(pass_context=True)
async def war(ctx):
    embeddom = discord.Embed(title="Dominion Status", description=DominionStatus, color=0x663399)
    #embeddom.add_field(name="Last Updated: NZST ", value=lastmodified) 
    await bot.say(embed=embeddom)

    """NOMADS CODE WAR"""
    embednomad = discord.Embed(title="Nomads Status", description=NomadsStatus, color=0x90EE90)
    await bot.say(embed=embednomad)    

    """LAST MODIFIED"""
    embedtime = discord.Embed(title="Last Updated: NZST ", description=lastmodified, color=0x000000)
    await bot.say(embed=embedtime)

"""DOMINION CODE BATTLE"""
@bot.command(pass_context=True)
async def battle(ctx):
    embeddom = discord.Embed(title="Dominion Battle", description=DominionStatus, color=0x663399)
    if DominionStatus == "Playing WAR":
        embeddom.add_field(name="Location", value=DomLocation, inline=True)
        embeddom.add_field(name="Players", value=DomPlayers, inline=True)
        embeddom.add_field(name="Playing As", value=DomPlayingAs, inline=True)
    #embeddom.add_field(name="Last Updated: NZST ", value=lastmodified, inline=True)
    await bot.say(embed=embeddom)  

    """NOMADS CODE BATTLE"""
    embednomad = discord.Embed(title="Nomads Battle", description=NomadsStatus, color=0x90EE90)
    if NomadsStatus == "Playing WAR":
        embednomad.add_field(name="Location", value=NomadsLocation, inline=True)
        embednomad.add_field(name="Players", value=NomadsPlayers, inline=True)
        embednomad.add_field(name="Playing As", value=NomadsPlayingAs, inline=True)
    #embednomad.add_field(name="Last Updated: NZST ", value=lastmodified, inline=True)
    await bot.say(embed=embednomad)  

    """COMMUNITY BATTLES"""
    embedcom = discord.Embed(title="Community Battles", description=CommunityStatus, color=0xffffff)
    if CommunityStatus == "WAR":
        embedcom.add_field(name="Location", value=CommunityLocation, inline=True)
        embedcom.add_field(name="Players", value=CommunityPlayers, inline=True)
        embedcom.add_field(name="Reported Ping", value=CommunityPing, inline=True)
    #embedcom.add_field(name="Last Updated: NZST ", value=lastmodified, inline=True)
    await bot.say(embed=embedcom)  

    """LAST MODIFIED"""
    embedtime = discord.Embed(title="Last Updated: NZST ", description=lastmodified, color=0x000000)
    await bot.say(embed=embedtime)

"""DOMINION CODE WHO"""
@bot.command(pass_context=True)
async def whoisplaying(ctx):
    embed = discord.Embed(title="DOM Members Playing War", description=DomMembersPlaying, color=0x663399)
    #embed.add_field(name="Last Updated: NZST ", value=lastmodified)
    await bot.say(embed=embed)

    """LAST MODIFIED"""
    embedtime = discord.Embed(title="Last Updated: NZST ", description=lastmodified, color=0x000000)
    await bot.say(embed=embedtime)

"""DOMINION CODE STREAMS"""
@bot.command(pass_context=True)
async def streams(ctx):
    embed = discord.Embed(title="DOM Streams", description=DomStreams, color=0x663399)
    #embed.add_field(name="Last Updated: NZST ", value=lastmodified)
    if DomStreams != "No Twitch Streams":
        embed.add_field(name="Links", value=DomLinks)
    await bot.say(embed=embed)
    """COMMUNITY CODE STREAMS"""
    embedall = discord.Embed(title="Community Streams", description=CommunityStreams, color=0xffffff)
    #embedall.add_field(name="Last Updated: NZST ", value=lastmodified)
    if CommunityStreams != "No Twitch Streams":
        embedall.add_field(name="Links", value=CommunityLinks)
    await bot.say(embed=embedall)

    """LAST MODIFIED"""
    embedtime = discord.Embed(title="Last Updated: NZST ", description=lastmodified, color=0x000000)
    await bot.say(embed=embedtime)

"""CODE FOR ALL"""
@bot.command(pass_context=True)
async def info(ctx, user: discord.Member):
    embed = discord.Embed(title="{}' info".format(user.name), description="Here's what I could find.", color=0xffffff)
    embed.add_field(name="Name", value=user.name, inline=True)
    embed.add_field(name="ID", value=user.id, inline=True)
    embed.add_field(name="Status", value=user.status, inline=True)
    embed.add_field(name="Highest Role", value=user.top_role)
    embed.add_field(name="Joined", value=user.joined_at)
    embed.set_thumbnail(url=user.avatar_url)
    await bot.say(embed=embed)

"""Commands"""
@bot.command(pass_context=True)
async def commands(ctx):
    await bot.say("=war\n=battle\n=whoisplaying\n=streams")

@bot.command(pass_context=True)
async def extracommands(ctx):
    await bot.say("=black\n=bestleader\n=conspiracy\n=trick\n=cat\n=chicken\n=irun")
    

"""Easter Eggs"""    
@bot.command(pass_context=True)
async def black(ctx):
    await bot.say("BlackPhoenix007 is a Bully!")
@bot.command(pass_context=True)
async def bestleader(ctx):
    await bot.say("Janisarry of course :heart:")    
    await bot.say("but, this chewy boi is a close second") 
    await bot.say("https://cdn.shopify.com/s/files/1/0859/3640/products/Pineapple_Lumps_1024x1024.jpg?v=1497230533") 
@bot.command(pass_context=True)
async def beststreamer(ctx):
    await bot.say("DrDisrespect, he is the face of twitch")    
@bot.command(pass_context=True)
async def conspiracy(ctx):
    await bot.say("Black_Hawk_689 pretended to be Gamatron, but what if Gamatron is Black_Hawk_689")    
@bot.command(pass_context=True)
async def knife(ctx):
    await bot.say("To this day KniF3cRazZy406 has never gone crazy with a knife") 
@bot.command(pass_context=True)
async def aiden(ctx):
    await bot.say("aidenxcracer no love dom :cry:")
@bot.command(pass_context=True)
async def trick(ctx):
    await bot.say("https://78.media.tumblr.com/4f72bb4c61df329ed4490cf5a349cb07/tumblr_ni895g5Uy61twedcto1_500.jpg")
    await bot.say("Janisarry?")
@bot.command(pass_context=True)
async def cat(ctx):
    await bot.say("cat- caught writing scripts by reto")
    await bot.say("http://3.bp.blogspot.com/_xiuhjcxeMQc/TSHCdtoOMtI/AAAAAAAABdo/QhK1hfIwqlI/s1600/Cat+Clarke+-+Jem.jpg")
    embedcat = discord.Embed(title="Reto-Moto", description="Player [cat-] has been banned.", color=0xff0000)
    await bot.say(embed=embedcat)
@bot.command(pass_context=True)
async def chicken(ctx):
    await bot.say("https://www.petagadget.com/wp-content/uploads/2017/10/22790569_10211852551643638_403399878_o.jpg")
@bot.command(pass_context=True)
async def irun(ctx):
    await bot.say("https://i.imgur.com/Mngw7WS.gif")


#Goes at bottom
"""DO NOT TOUCH"""
bot.run("NDQwMDUzMjU3NDM2NTI4NjYz.DccHEA.ByQ6mwFXUOrnu66znwSvK-svjf8")
