Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793563605;
	b=a2wKLTlL2qiNhox2r5Vvz7J8uuYvRkqJ2jeilbd/8PqdQGRxfoWBBxNjZIHK3e5vOUcs
	 qZ8/u/daCwjwP4DPJ8EnvklrpeE2W1U0PIhsNuVxZNgAQRitcOh+PynBN7YoJ3rrLwInn
	 mhAfYdv3FYyHeivcOYLb5+xb9JQHLZMG/dd+yF7Wpi0vaf7Y2o968aOccRdksNXNLxI2/
	 Z0x7Ccpug79CqTUDAO9+Yvc3bYsSJnlATpppAScevhQCiTTfZg1dao7uFODoga8jI6bdm
	 XQQ5UYSleJpCnqoTgaK8hDbL3ZjtNOTrC6A5f3liSj8N8/qYt/XD/ejnMYoUonp805A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563605;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=laBzuwzrH9YIVUfs10Hcno3yhz0Vqej/iXwjHqfMmqs=;
	b=dLdfj7GLqi/nDHOTtdkHOhFnSNCAYaGe/vXY0jgKsRXJFDX0M7ZN9FRLW0pnZdeeJyNS
	 OuielcT82fud30U0Sa9luNHenPoATbmWaVBQuMPA6bgYsd4r2ZyOM1ujjjiuDhuvtLP2f
	 zIFsHJeqOmUKOrm/fBxiiwfPsv5AfR0el22aCfUq9O0HXzGQUTEic8ebTOxJ9FuhtDy3o
	 DZhSHYS2cEEM0g4hMujqvWZcf7h9qPBcuU2NbEiHaDGLOz/3eJTM9fQukaxNMdxJPTuiy
	 bnzgjf6vwljY3epmWgQuLh7So8rzzX/GNVL18+UWhyozO1/r/2q48GEDd80ckoJm3HA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=AR4fJ7YW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4410A606A324
	for <linux-media@vger.kernel.org>; Sun,  1 Nov 2026 20:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4410A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=AR4fJ7YW
ARC-Seal: i=1; a=rsa-sha256; t=1793563577; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=he1fGCBJJmmf5MmlOBa8csrv0eH41CKkxSG7oG7tWcFLGLg8/UsKfcfMoYa5Ux9WkPSqxA97CC3z+wgw9zhj7zFq+HUXge3w1liuVJHB9nzNxRH17FD7yPIkpPPe+qzZNnEJpphQWiYOMZgwyMDTyjBrt02divRzLmltEqji2TQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793563577; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=laBzuwzrH9YIVUfs10Hcno3yhz0Vqej/iXwjHqfMmqs=; 
	b=Z/sTnFx2i93W8cZ+lHIABHKa4WybTqwmf2UerZPLDm8M4kH55dN363H6xQ6BQUREqLSmIGc9chCbUMigCLe6JhLahuwdVXL/1EELIRFvQNsOqg1FrYmbMfGtS9tt7do2PmleEJK3fQtYmihaUXAg06xGCIaie6AhYYGn86tGHVs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=robert.mader@collabora.com;
	dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: a=rsa-sha256; b=AR4fJ7YWwYMT3Ubt5ChFP6oQJYCOzn92Ud2V16/swe/3XF1MlIlH7ZT8tABMszEMzTHwcIN9dnnBQ4/MydjcwUXmjaV4xBxfg6I+0nWRf0/GhLnPsZAOZDRjBtTg+ZwGb8ujPp6Tdt6OPHyCVFJlzJicSnx/CTTZmSgD01Zgygc=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=laBzuwzrH9YIVUfs10Hcno3yhz0Vqej/iXwjHqfMmqs=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793563575236637.5879201460525;
	Sun, 1 Nov 2026 12:06:15 -0800 (PST)
Message-ID: <5f4d3457-16cc-465d-83a9-f3df149f28c1@collabora.com>
Date: Sun, 1 Nov 2026 21:06:10 +0100
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
To: Alain Cousinie <alain.cousinie@laposte.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Milan Zamazal <mzamazal@redhat.com>, libcamera-devel@lists.libcamera.org,
 Sakari Ailus <sakari.ailus@iki.fi>, =?UTF-8?B?8J+Qpy1tZWRpYQ==?=
 <linux-media@vger.kernel.org>
References: <c218b8a2-9e69-4ef3-b36c-7df7e7637d4d@laposte.net>
 <3a98bb5e-a4c4-40b7-ad4d-1b251c03b4ff@oss.qualcomm.com>
 <20261101164311.GA3368923@killaraus.ideasonboard.com>
 <304e2a5a-f8d8-427d-84f5-b6f4498452df@laposte.net>
Content-Language: en-US, de-DE, en-GB
From: Robert Mader <robert.mader@collabora.com>
In-Reply-To: <304e2a5a-f8d8-427d-84f5-b6f4498452df@laposte.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 01.11.26 18:25, Alain Cousinie wrote:
> Le 01/11/2026 à 17:43, Laurent Pinchart a écrit :
>> CC'ing Sakari and the linux-media list.
>>
>> On Sun, Nov 01, 2026 at 05:31:14PM +0100, Hans de Goede wrote:
>>> Hi,
>>>
>>> Note please use johannes.goede@oss.qualcomm.com note the "oss." in there,
>>> this is also the email which I use as author / S-o-b for all my patches.
>>>
>>> On 1-Nov-26 17:23, Alain Cousinie wrote:
>>>> Hi Hans,
>>>>
>>>> Forcing packed monochrome (`CSI2P`) on VGA sensors (640x480)
>>>> triggers a systematic `stream stop time out` on Intel IPU6/IPU7.
>>>>
>>>> The hardware reason:
>>>> * IPU6 DMA burst requires strides to be a multiple of 64 bytes in
>>>>    pass-through mode (`PIN_TYPE_MIPI`).
>>>> * 640 pixels × 10-bit packed = 800 bytes per line.
>>>> * 800 % 64 = 32. The MIPI End-of-Packet (EOP) arrives mid-burst.
>>>> * The kernel driver requests a stride of 832 bytes. The firmware
>>>>    detects the conflict, starves the DMA controller, and hangs at
>>>>    stream stop.
>>>>
>>>> Unpacked mode (`MEDIA_BUS_FMT_Y10_1X10`) works flawlessly because
>>>> the IPU6 unpacks to 16-bit before DMA, resulting in a perfectly
>>>> aligned stride of 1280 bytes (1280 % 64 = 0).
>>>>
>>>> GPU benchmarks on Intel Arc (MTL) show that packed vs unpacked math
>>>> is entirely Memory Bandwidth Bound. Arithmetic LSB decoding is
>>>> executed for free during memory fetch wait cycles. There is no
>>>> performance benefit to forcing packed mono if it breaks the IPU6/7
>>>> firmware.
>> The whole point of using a packed format is to lower the memory
>> bandwidth usage.
>>
>>>> Can we update the Simple pipeline to exclude CSI2P for monochrome
>>>> formats when an Intel IPU6/IPU7 input bridge is detected?
>>> This sounds like a kernel issue if packed mode cannot work, then the
>>> kernel should not list the packed fmt when the sensor is producing
>>> MEDIA_BUS_FMT_Y10_1X10.
>> It's not just mono formats, it applies equally to bayer formats. Won't
>> that break the patch that fixes crashes in the CPU soft ISP on IPU6 and
>> IPU7 ?
>>
>>> Offering the option to do packed and then expecting userspace to know
>>> the hardware does not support this is not how this is supposed to
>>> work.
>>>
>>> So please modify the ipu6 kernel driver to not report the packed
>>> framebuffer fmt for the MEDIA_BUS_FMT_Y10_1X10 bus fmt.
>> Better, fix the driver to handle the stride correctly and not stall.
>>
> Hi Hans, Hi Laurent, Hi Sakari,
>
> As an individual user who bought an Intel-powered HP Spectre laptop with my
> own personal money, I chose Intel because I appreciate their hardware. I would
> appreciate them even more if their teams made the effort to communicate more
> openly with the open-source community. It would be nice if my little IR camera
> could work without forcing top-tier maintainers to fight over kernel
> workarounds. Kind and humorous does not mean naive.
>
> This case highlights a broader political issue: the open-source community
> willingly works with and supports private companies. This collaboration is
> a good thing, but its political balance needs to be reassessed when private
> entities benefit from open code while locking their own logic inside closed
> firmware boxes, leaving us to guess the hardware constraints.
>
> Jokes and politics aside, Laurent's point about fixing the kernel driver to
> handle the stride correctly is the cleanest architectural goal. However, since
> the restriction is locked inside the black-box firmware microcode
> (ipu6_fw.bin) enforcing the strict 64-byte DMA burst alignment, we are stuck.

I just wanted to add that AFAICS the 64-byte alignment is also required 
for our GPU dmabuf import fast-path on Intel. If we don't hit that 
fast-path we need to do an extra copy. So for the softisp we'd rather 
have 64-bytes aligned unpacked buffers than packed ones without that 
alignment.

Regards,

Robert

>
> Sakari, since you are in the loop, do you think the Intel firmware team
> could look into this unaligned VGA packed stride freeze on stream stop?
>
> In the meantime, Hans' filtering approach seems to be the only practical
> safety net for userspace stability.
>
> Regards,
> Alain
