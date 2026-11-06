Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949388;
	b=NiDpRVcj4m3Rku3y/G1LWQCoMEZwvMgpQeqlrZ/vrGOfcU6YLzG2zACZyB5bGGLJskqM
	 d7P1YhjobDBDUeTs39BZ8IsuoF3CVBJM3+qNnXYCgIPakviCh2JR/WsNTdzQEZ9APnI4s
	 aWvFEmAcLZpo6PpMDHlldzK2/uXVhNtaZpCddy2+N9WS92JLE9cAOQANvAkPjSemP2h+G
	 ctJrdNyxyGaz4e3PON1ASHr2C7FgJ/ciqu1sNheYRDC25+gvjSUAjkbOKa0WtXocXVOua
	 ssktvXv4qL6n1pq6z6Mt0XlV7Y+U7RIC34NR01BLY1sKZBhj6h1lKhzs/HBxiTEzxeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949388;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=j04l0OjX2fJ1EwMqYUFKZTcv4Vu2ps9Ask75WPszo/4=;
	b=LWrZkVjClDHOwKCkGZJVTnAjMSM04Ep7Wf1z9G02VlEH6C/3Z2+qF2ylANgMnMuNkuRu
	 8nyaI0XxtJnpoM2EJ7Fy260jOFcsWJ2y99GZDbQjyfTeVzQF/Gvl8dG/w5dgPbdosxzID
	 f94DROBXsQQS+cvKvn4/kOOUOUpQJ7uQ+6pMrumuS0EIq656LElNBO/UVdyZgatjDckUF
	 4g1/T93rDF19nnRX87JZlk7ouNHAnEC8GtRHq6aRBLup2VkQik1Lp7tdCpqqNKbrEa30U
	 9wKVYIMG0IKKx5hL38iWxaaOccKkDXxAURBKCgFKky3UjkghB8ArXM//c7q2DhyYtcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=guido.kraemer@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=IP0YHhN7;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEC8606A330
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 07:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EEC8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=guido.kraemer@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=IP0YHhN7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793949381; x=1794554181; i=guido.kraemer@gmx.de;
	bh=j04l0OjX2fJ1EwMqYUFKZTcv4Vu2ps9Ask75WPszo/4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IP0YHhN7t4Hm3xeCzIVp6s+joX+dcpQZTRI8pacDzPIMO65pN4j3GfdZ4rgBXaSz
	 0qkAp8CPeMWGakC/iKxywzZX8Oily52vaipf6NHrZ7hVHNzV1V7Ma48ZYrmARJl30
	 CTaWwvtd1Y0Y1w/vh3nEALhmXN9d1D3qv12UZKSVoO4D5NVLp16g7b9LHd/ntyEC1
	 uEWFKgdh4/F8GLI5fKXDZ2HKFj//O8wPa361a/T3pxyB4z99tOZwDe+3z9xrhXaiJ
	 mil2UljoAXahT7Rm58SIRFOLsfj3KWB5FWG4np+xmlzQC0vs0bjo4a9Rem6bK0Yh5
	 h7XqC0Y3tiXB32RITA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zFj-1wUK1O0Npz-0132Yl; Fri, 06
 Nov 2026 08:16:21 +0100
Message-ID: <e47d47c0-9074-4245-9929-5bf2cf4f210d@gmx.de>
Date: Fri, 6 Nov 2026 08:16:20 +0100
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
Subject: Re: AMD ISP4: SET_STREAM_CONFIG fails, no frames on HP ZBook Ultra
 G1a
To: "Nirujogi, Pratap" <pnirujog@amd.com>, Bin Du <bin.du@amd.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: linux-media@vger.kernel.org, Caspar Adriani <caspar.adriani@proton.me>,
 Seifelden Abdelmonem <saif.elden.hatim@gmail.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>
References: <3e8ae2ad-c804-45c3-8c52-ab25481cb430@gmx.de>
 <4f905414-6fa1-4668-bb0b-d06a5883e10a@amd.com>
Content-Language: de-DE, en-US-large, es-ES
From: Guido Kraemer <guido.kraemer@gmx.de>
In-Reply-To: <4f905414-6fa1-4668-bb0b-d06a5883e10a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:IYPi955N54w7fwoUTtBjlg9SzenGXocHBpkCtNjwVc2Hm78TkH3
 cDb/qU4nXv4oPT/uiEf0LIqJYUaTrGw4FcFqPHWwOPXyxe5yfCosToyWVugibHZ4WPAAc5B
 wVO1tJBZWEne0+hApxBB/oHIFL9YHyO69jArqHFx+kCTS+u+0acobW/fd48vnp2MWCar3Qw
 9lj+yUJyukXVS2+QzvqNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rLWMkuhmYs4=;BG1ZoZVYE2wGmFTR4xRBv2LtTJF
 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
 fNoUPhcl+elFgh3c6186PlyMuCmD314D86ng==

Hi Pratap,

thanks for the quick answer.

On 11/6/2026 1:39 AM, Nirujogi, Pratap wrote:
> I don't currently have BIOS X89 01.06.02 readily available. Would you
> mind sharing it with me, along with any additional steps required to
> reproduce the issue locally?

I installed it with fwupd from the LVFS:

   https://fwupd.org/downloads/9d988c4438eb1a270724255864ad2a3a85dbea3e34b41504c462f26b3785defa-X89_01060200.cab
   SHA256 9d988c4438eb1a270724255864ad2a3a85dbea3e34b41504c462f26b3785defa
   (X89_01060200.cab, 36935606 bytes, AppStream ID
   com.hp.laptop.system.X89.firmware)

HP's support page for the ZBook Ultra G1a lists the same version,
01.06.02 Rev. A, presumably the same build:

   https://support.hp.com/de-de/drivers/hp-zbook-ultra-g1a-14-inch-mobile-workstation-pc/2102737532

Steps on my machine:

   1. Update from BIOS 01.05.07 to 01.06.02 (fwupdmgr update).
   2. Boot Linux 7.2.6 (Arch) or 7.3.1; both behave the same.
   3. Open the camera, e.g.
        v4l2-ctl -d /dev/video0 \
          --set-fmt-video=width=1920,height=1080,pixelformat=NV12 \
          --stream-mmap=4 --stream-count=5 --stream-to=/dev/null
      The stream starts, no frame arrives, SET_STREAM_CONFIG returns
      status 1 after about 7.85 s, and the stop times out.

Nothing else is special: the camera is enabled in the BIOS setup,
linux-firmware-amdgpu 20260916, no module options. Before the update,
on 01.05.07, the camera worked with the same kernels.

> The reason code is already being sent to the host: it is the
> isp4fw_error_code field of struct isp4fw_resp_cmd_done. The driver just
> does not print it. Adding it to the existing dev_dbg() in
> isp4sd_fw_resp_cmd_done() will give us more details.

I added it (and the raw payload of unknown notifications) to the
debug output and tested after a fresh reboot, camera enabled in the
BIOS setup. The first stream start after boot looks clean, but the
sensor still delivers nothing:

   08:05:18.078281 ISP CCPU FW boot success
   08:05:18.277367 stream 1,cmd ISP4FW_CMD_ID_SET_STREAM_CONFIG(0x02010001)(0),err 0x0000,seq 1, ele 0000000000000000
   08:05:18.277927 stream 1,cmd ISP4FW_CMD_ID_SET_OUT_CHAN_PROP(0x02010003)(0),err 0x0000,seq 2, ele 0000000000000000
   08:05:18.278011 stream 1,cmd ISP4FW_CMD_ID_ENABLE_OUT_CHAN(0x02010005)(0),err 0x0000,seq 3, ele 0000000000000000
   08:05:18.294390 stream 1,cmd ISP4FW_CMD_ID_START_STREAM(0x02010007)(0),err 0x0000,seq 16, ele 0000000000000000
   08:05:19.466406 -><- fail respid unknown respid(0x30002) seq 1 param 0e 00 00 00 11 00 00 00 00 00 00 00 [rest 00]
   08:05:20.635400 -><- fail respid unknown respid(0x30002) seq 2 param 0e 00 00 00 11 00 00 00 00 00 00 00 [rest 00]
   08:05:38.016298 status 1
   08:05:38.016513 wait disable stream suc
   08:05:38.016564 wait stop stream suc

So all commands succeed, START_STREAM included, then the two "no MIPI
data" notifications follow (payload 0x0e, 0x11), and the stop is clean.

Every later start, even after the ISP was powered off in between,
fails at SET_STREAM_CONFIG with error code 6, about 7.87 s late, and
the stop times out:

   08:05:47.753256 ISP CCPU FW boot success
   08:05:55.623334 stream 1,cmd ISP4FW_CMD_ID_SET_STREAM_CONFIG(0x02010001)(1),err 0x0006,seq 24, ele 0000000000000000
   08:05:55.623671 stream 1,cmd ISP4FW_CMD_ID_SET_OUT_CHAN_PROP(0x02010003)(0),err 0x0000,seq 25, ele 0000000000000000
   08:05:55.623724 stream 1,cmd ISP4FW_CMD_ID_ENABLE_OUT_CHAN(0x02010005)(0),err 0x0000,seq 26, ele 0000000000000000
   08:06:13.237311 fail to disable stream
   08:06:13.741285 fail to stop stream

Error 6 is also what Caspar saw on the GZ302 with an unsupported
sensor. Reloading amd_isp4_capture does not bring back the clean first
start; after today's reboot it was clean again.

Thanks,
Guido
