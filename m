Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.92.124.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553929;
	b=wxAOlSaY1UdBOg08IziZjvMS82NkhXmugPR00tEnq1YorI68BCJubVqrI/yk+mMzlDAB
	 U9RKJetnLZ6ZHECoZZkJyy4npMqQ8/Zi6U/pWqJScnP6E8OhfWn3tU/pgxNx9lU14D0n6
	 GrxGbPt1x6Bwk7Lifd7CyvfUTauJA2nv59kvQpRDOS/k9k/XNQbuynXn0V1dbIFwMlWh4
	 kEyQNVsYBHf8obPaZ0kxfTB/Ut40Q+AcKuYGhv8T54Vrk01h6xi6kjgzUcEhv9nqhW+jm
	 H1yPLwhP47Msf/La/dt+/RtWwAxm0mIVweayRKrKVq06GtbBNtzDkDAWYM2nj7eIthw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553929;
	h=DMARC-Filter:X-mail-filterd:Received:X-mail-filterd:X-lpn-mailing:
	 X-lpn-spamrating:X-lpn-spamlevel:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 DKIM-Signature;
	bh=FrOEE6ZtpQQ3HsV7T5OTaTQiJRfvnBBjYUpDMo4bNDk=;
	b=YuE3ZLECqgT48a2/paWq85wbnaOOYgh2gYrhRmyP4oOTbTXGHMAAQZPQ7s/reMmRnpNs
	 axtyiY2Q8ofBrGWCzAJ0vN20v17xFi9qaqgQqVgpcDENXaJ97caJYrQygt62cYapKHcUs
	 1VzcSBSYY1xPlijQwDTji4cbTd5QaHigLhk45sTxIY1Rj/czeEqX6/cFnfQ9vAL6UAQLa
	 dQ2LL/sfV858gUkTmFUGDFnw19bvC4mDIywFCzrWb9gXivenFipDZT1HS+LWAiejzg62B
	 7A89UPWDAPj9uxEiqxQxnAWXjJEZze43jZX6XuLeZucIhdeFqVYaOc8X1ddckMbKUoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=laposte.net;
	spf=pass smtp.mailfrom=laposte.net;
	dkim=pass header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256 header.s=lpn-wlmd header.b=Ju2RFExO;
	arc=none smtp.remote-ip=160.92.124.107
Received: from smtp-outgoing-1903.laposte.net (smtp-outgoing-1903.laposte.net [160.92.124.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529E4606A337
	for <linux-media@vger.kernel.org>; Sun,  1 Nov 2026 17:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 529E4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256 header.s=lpn-wlmd header.b=Ju2RFExO
X-mail-filterd: {"version":"1.9.7","queueID":"4jHhYQ1CfmznTV2","contextId":
 "a713e353-35b5-4cfa-9dda-6c6ccfb4d2cb"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0113.laposte.net (SMTP Server) with ESMTP id 4jHhYQ1CfmznTV2;
	Sun,  1 Nov 2026 18:25:14 +0100 (CET)
X-mail-filterd: {"version":"1.9.7","queueID":"4jHhYP4LcDznTV1","contextId":
 "7edac36f-c6ba-4328-8e43-235bba492dba"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from [192.168.1.2] (m-dj.hd.free.fr [82.67.82.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0113.laposte.net (SMTP Server) with ESMTPSA id 4jHhYP4LcDznTV1;
	Sun,  1 Nov 2026 18:25:13 +0100 (CET)
Message-ID: <304e2a5a-f8d8-427d-84f5-b6f4498452df@laposte.net>
Date: Sun, 1 Nov 2026 18:25:13 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: libcamera: pipeline: simple: Disable packed mono for VGA sensors
 on Intel IPU6/IPU7
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Milan Zamazal <mzamazal@redhat.com>, libcamera-devel@lists.libcamera.org,
 Sakari Ailus <sakari.ailus@iki.fi>, =?UTF-8?B?8J+Qpy1tZWRpYQ==?=
 <linux-media@vger.kernel.org>
References: <c218b8a2-9e69-4ef3-b36c-7df7e7637d4d@laposte.net>
 <3a98bb5e-a4c4-40b7-ad4d-1b251c03b4ff@oss.qualcomm.com>
 <20261101164311.GA3368923@killaraus.ideasonboard.com>
Content-Language: fr
From: Alain Cousinie <alain.cousinie@laposte.net>
In-Reply-To: <20261101164311.GA3368923@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1793553920; bh=eKlYEp09c66zzi4TToK87DXoKRVq6bqhZYoLKzKIRPU=; h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=Ju2RFExOcDeoIai2BdnyGyPxw/E7YoYN+DAL5w4QOyn1jxsT4tV/DR+T8yJLf6GQvvrue0Cd3lomjhXGv00aYcZ2V26XGvNogcb0rx652CPlcdu/bfPgpkM8NBiR4AeU3annT4j8caPaHzIXangZnJFufzeiCZebAvi3JShKUuuHI48wEvWWgI9gzxwD40ytx1lRK9rzg7uO6PrUjxAsVKH04sWKkCxUG939fDjxNvoMhsc+tAKn8qsR/4kLCdsXISVyFUMtBBGmKdTQ4M6/CBfRmGgNBS+IwLo9Rlr18oI99RG8KMpl3oBJZXSdxXAfGpl9qBzT5ojNeMvR8LLnQQ==;

Le 01/11/2026 =C3=A0 17:43, Laurent Pinchart a =C3=A9crit=C2=A0:
> CC'ing Sakari and the linux-media list.
>=20
> On Sun, Nov 01, 2026 at 05:31:14PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> Note please use johannes.goede@oss.qualcomm.com note the "oss." in the=
re,
>> this is also the email which I use as author / S-o-b for all my patche=
s.
>>
>> On 1-Nov-26 17:23, Alain Cousinie wrote:
>>> Hi Hans,
>>>
>>> Forcing packed monochrome (`CSI2P`) on VGA sensors (640x480)
>>> triggers a systematic `stream stop time out` on Intel IPU6/IPU7.
>>>
>>> The hardware reason:
>>> * IPU6 DMA burst requires strides to be a multiple of 64 bytes in
>>>   pass-through mode (`PIN_TYPE_MIPI`).
>>> * 640 pixels =C3=97 10-bit packed =3D 800 bytes per line.
>>> * 800 % 64 =3D 32. The MIPI End-of-Packet (EOP) arrives mid-burst.
>>> * The kernel driver requests a stride of 832 bytes. The firmware
>>>   detects the conflict, starves the DMA controller, and hangs at
>>>   stream stop.
>>>
>>> Unpacked mode (`MEDIA_BUS_FMT_Y10_1X10`) works flawlessly because
>>> the IPU6 unpacks to 16-bit before DMA, resulting in a perfectly
>>> aligned stride of 1280 bytes (1280 % 64 =3D 0).
>>>
>>> GPU benchmarks on Intel Arc (MTL) show that packed vs unpacked math
>>> is entirely Memory Bandwidth Bound. Arithmetic LSB decoding is
>>> executed for free during memory fetch wait cycles. There is no
>>> performance benefit to forcing packed mono if it breaks the IPU6/7
>>> firmware.
>=20
> The whole point of using a packed format is to lower the memory
> bandwidth usage.
>=20
>>> Can we update the Simple pipeline to exclude CSI2P for monochrome
>>> formats when an Intel IPU6/IPU7 input bridge is detected?
>>
>> This sounds like a kernel issue if packed mode cannot work, then the
>> kernel should not list the packed fmt when the sensor is producing
>> MEDIA_BUS_FMT_Y10_1X10.
>=20
> It's not just mono formats, it applies equally to bayer formats. Won't
> that break the patch that fixes crashes in the CPU soft ISP on IPU6 and
> IPU7 ?
>=20
>> Offering the option to do packed and then expecting userspace to know
>> the hardware does not support this is not how this is supposed to
>> work.
>>
>> So please modify the ipu6 kernel driver to not report the packed
>> framebuffer fmt for the MEDIA_BUS_FMT_Y10_1X10 bus fmt.
>=20
> Better, fix the driver to handle the stride correctly and not stall.
>=20
Hi Hans, Hi Laurent, Hi Sakari,

As an individual user who bought an Intel-powered HP Spectre laptop with =
my=20
own personal money, I chose Intel because I appreciate their hardware. I =
would=20
appreciate them even more if their teams made the effort to communicate m=
ore=20
openly with the open-source community. It would be nice if my little IR c=
amera=20
could work without forcing top-tier maintainers to fight over kernel=20
workarounds. Kind and humorous does not mean naive.

This case highlights a broader political issue: the open-source community=
=20
willingly works with and supports private companies. This collaboration i=
s=20
a good thing, but its political balance needs to be reassessed when priva=
te=20
entities benefit from open code while locking their own logic inside clos=
ed=20
firmware boxes, leaving us to guess the hardware constraints.

Jokes and politics aside, Laurent's point about fixing the kernel driver =
to=20
handle the stride correctly is the cleanest architectural goal. However, =
since=20
the restriction is locked inside the black-box firmware microcode=20
(ipu6_fw.bin) enforcing the strict 64-byte DMA burst alignment, we are st=
uck.

Sakari, since you are in the loop, do you think the Intel firmware team=20
could look into this unaligned VGA packed stride freeze on stream stop?

In the meantime, Hans' filtering approach seems to be the only practical=20
safety net for userspace stability.

Regards,
Alain
