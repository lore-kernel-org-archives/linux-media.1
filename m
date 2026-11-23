Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448615;
	b=w4+Xlwx6+XXRoRx0NJEG2EU0PSJ3aBh3H+kj24iv8sDIavdTCgt6JV8NUWt9Nkje1Uvy
	 Hpyg/G4cP+OALtKBhVKs2bQU09y8vUMWxWT3a1BPhwSNQA7GMoZT4hxJrv/S/kiHDgadE
	 jABDK/Bj8UkDdsjHISMohQrlXcJ0j21aHRZIb/dnTyNtkgZYSvxtDexJHJHorbTlIsaFm
	 1JoPsOVMKmAetP4z9Zs3uhFjlBeOb3XladbG7Kj+IoIHICYm85l6EGMcK9eQBcxX2gwrG
	 q/G98hiZ8rjPaBlBF1bLOijUsiVp0YcsV5GljTtWXnV84ev16nd3nx9zhI4HnX2aLgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=d5cgBFd77W/tWQjO7/bS9vicFWfYGE4f+xf+U4n6zyY=;
	b=dNfPz7ZoGGDeC3Xmj4EzQsAbzvBVG1+G+2HUvzEQozXyb3O/HaXASvqwxF37FxcHyKvV
	 OwwKJ55wKUfhH8kQnj498srf25IVCxqgvCcndrg/VHdVrb4xqK6M8s9uhM3h0j9A0IEcc
	 mdNPdg19Nmhv+55P315jQnB1aAApZvcfujdIEwoHkv+f8U7p+kFzVlGLS6JxaPirV9POw
	 FxrwODdJz2iUbMLM0lgRCEFpLj3YkRZDSvlJK2Oy3k3sICa2Ln/S2dkv5bY2rxQUKP8bC
	 Wln8a5f5ZvybGu6DhULF52uUsPp3PqglbD1UqWJPkwUyhDTxGs9s1U9kY5BtP0vS5GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="o/vovQXJ";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF61606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EF61606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o/vovQXJ
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492690dd5daso2616294f8f.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448613; x=1796053413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d5cgBFd77W/tWQjO7/bS9vicFWfYGE4f+xf+U4n6zyY=;
        b=o/vovQXJ+1591VfF4wKtToDRQkBrNOydr42lDWgPvAFMLqIE4p4gTIhZcVNH5EA8kU
         YfdvGqD/nOnkH5dJmGhPs5aFTK2kx/ebVY7+b+pJBD19kPdLQV6PbxX+ST4hXyS3SUSm
         80vuYsp0o3t4SyXSr+MRUZIIWAsMgM0eGTnOrmu7czQA86pvMn/zaI1C5+ow38oksvrr
         TAeMbuxmSdwJ6demLm1mvDiEswfkX/yuhdfdPAc4tpg/2zTWI9uZ+NUGGHgCj0NQhsb+
         BPTns9MdQWbmjyAImJpf1HTpMQ0njoUomWK9hZPINzt53s01f2F/rRcstb7lJ2q1mc0m
         OuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448613; x=1796053413;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d5cgBFd77W/tWQjO7/bS9vicFWfYGE4f+xf+U4n6zyY=;
        b=bIkQ7zpriWKS5+96X/fBNaaFgT5jHlcU0Wes/n4kj1eZkLSM5ojw9JDmyEEjmDf10H
         CzX8ZoCd71F13sRaz8KEQ1VECx2gWD6v1cOWB3WbQmw6gRI3ow1auAXbsfteK1Jahdco
         ihWy+IJlJkk8aOcBWbMlcqCs+qVeYDeApWlBAEIfeveFF17pkjLLSta5wwnIDTXAZbaU
         ZOlDLs1vdy3r+U5vaXl/g3wDDvJYVeUftUdWE3RxNnqNAYdOfP1gl9gb66MSnQw0rmpG
         4BpFyMhWRUWNMgpQtHwy8F7XkP3MWo6/a5smeF3EsnfjY2u3EcjL/lbRjVEXEvI+LZYr
         u1cw==
X-Forwarded-Encrypted: i=1; AL+hErHLicNzzD+4pKo/j5vZtKUcdm86UA5nXXlIxhOTZdxVEOu65vOLZu6asv+GC/Z+cooc+8nia9cgqGlBvQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/g3pzzPs7gUZcbeM16VXH1xGNtf3RHjFlSPAK7JcBkalZswEhV
	/6Cwf1WpV6/p11ocue7J6uRpDcPcxrFM9dqjNzCWPfXd9tLilTP2cB1+
X-Gm-Gg: AZFdTZeCqk4/SVHgs2mnXhkUdZKUY4YY0AXLvMYpjdsyvDkG1Swn0u/DCLe6CBOvN4M
	DdEd21uEsARaQfoXSEa/q59RooB3tAgCMwcqH/y9P9O/yNcyyf+c5uDfgREM1XAVmbLkkuylDX9
	RBikWJ0IKZqegA8dXrF5T3DVyxWZ708PDg+Sg+1JHuU2XNbOlm8xmK/+CpDMamXaDYfl5wttwKl
	6b20ijOSD9KExlPv1z4gZcr9wj1bICouyxDjILs+IzAESXhWRdIrc+YivdNlqadJcfYJWm83eBA
	jFiTa2ZULpcV+YHJSP1XzTaHY6B8E4lcPW/JfMaETg4Ve8sg3MZvPHZhv9lhzJ26vYJoAvDzaFx
	5V1Oaf/99VqZLMIERrBmmgYXJwSIw/swtzOM6/t5YENBILVGkrJkwqgs03rMD2nV57HvZEA9h08
	YYnQaWgZeoO7617//bhXRnaXGMlCAIbYvXRk2lvO6ddChrXVjr2ZCap2WsaeY6hRkVdMRyEtIeH
	1rZv2m+2WJS5bj17r+SUBY1G0eES2Vs9pGzJTvfqk/Jmx9wOmicOicJRZOgWATQKJYQDC2dhhrO
	xAjOCd7889M+m9RaN4UYOkjGsynSYGti0MWkYf1mWnMooIHHpVTHl6qsLzAWHQ3JUGEJ8Gq9Uy4
	jyQ==
X-Received: by 2002:adf:e889:0:b0:491:da8f:7276 with SMTP id ffacd0b85a97d-4abb2dda221mr18315423f8f.26.1795448613308;
        Mon, 23 Nov 2026 07:43:33 -0800 (PST)
Received: from ?IPV6:2a02:8109:8617:d700:b6a2:ed8c:70c4:c02d? ([2a02:8109:8617:d700:b6a2:ed8c:70c4:c02d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm22873290f8f.49.2026.11.23.07.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:43:32 -0800 (PST)
Message-ID: <b0bd70d7-886a-478f-867a-55e94c9e0b10@gmail.com>
Date: Mon, 23 Nov 2026 16:43:32 +0100
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
Subject: imx8-isi on imx8mp
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "Frank Li (OSS)" <frank.li@oss.nxp.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>
References: <2634d4f0-b5f0-419b-bdc7-56f8e761f140@gmail.com>
 <AMBPR04MB3355237A67AF9D2CC504A98548FA9E2@AMBPR04MB335523.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Martin Hecht <mhecht73@gmail.com>
In-Reply-To: <AMBPR04MB3355237A67AF9D2CC504A98548FA9E2@AMBPR04MB335523.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

my break on my imx8mp job a bit longer. My I come back with some 
questions regarding upstream imx8mp csi setup?

The way shown by Guoniu works so far as I can get streaming running but 
with some bugs.

My hardware itself is ok and works well when booting linux-imx ....

Currently I tested two of various possibilities:

1. Streaming in Y8. My cameras/sensors support Y8 over CSI2. I can 
receive a stream but I see CRC errors despite the csi-rx settings seems 
similar as the values for hs-settle on the staging driver. But it seems 
a lot of lines are missing. So I can see a frame change after half of 
the image high and a second one after 1/4 of the image high. But it's 
not stable.

2. Because my cameras can also stream in yuyv 422-8bit 
(MEDIA_BUS_FMT_UYVY8_1X16) already I would expect that imx8-isi could 
bypass the csc as I'm used to stream when using linux-imx (staging driver.
According the listed formats in imx8-isi-pipe.c also media-ctl is not 
able to change the output format of mxc-isi to MEDIA_BUS_FMT_UYVY8_1X16 
and stucks with MEDIA_BUS_FMT_YUV8_1X24. But this shoudn't be accepted 
when specifying pixelformat=YUYV as shown below in the example. There is 
a little explanation in lines 30 to 33. Does that mean you would really 
like to have an additional subdev for the csc on imx8mp?
Nevertheless the resulting output seems to be some kind of UYVY8_1X16 
but the resulting image is odd.

Nevertheless the output of the v4l20ctl tool while capturing to 
memory/file looks as expected.

Did someone same observations?

BR Martin


On 10/13/26 03:15, G.N. Zhou (OSS) wrote:
> Hi Martin,
> 
> First of all, thank you for using NXP products.
> 
> Below are the steps I used locally to get the i.MX8MP ISI video pipeline up and running successfully.
> 
> Kernel: https://git.linuxtv.org/media.git/commit/?id=d7e7bca7169873b46e857c025c10f3336c1258d8
> DTB: imx8mp-evk.dtb
> 
> Hardware setup:
> - i.MX8MP EVK
> - OV5640 camera sensor
> 
> Kernel build:
> # make defconfig isi.config
> 
> Test procedure after boot:
> - Verify that the media device is available:
>     # ls /dev/media0
> 
> - Run the attached setup.sh script to configure the media pipeline.
>     # ./setup.sh
> 
> - Start video streaming using:
>     # v4l2-ctl -d 0 -v width=1920,height=1080,pixelformat=YUYV --stream-mmap
> 
> - Expected result:
>     root@imx8mpevk:~# v4l2-ctl -d 0 -v width=1920,height=1080,pixelformat=YUYV --stream-mmap
>     <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.00 fps
>     <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.00 fps
>     <<<<<<<<<<<<<<<<<<<<<<^C
> 
> root@imx8mpevk:~# uname -a
> Linux imx8mpevk 7.3.0-rc1-gd7e7bca71698 #64 SMP PREEMPT Tue Oct 13 01:02:11 UTC 2026 aarch64 GNU/Linux
> 
> I hope this information could help you.
> 
> Best Regards
> G.N Zhou
> 
> 
> 
> 
> NXP Public
>> -----Original Message-----
>> From: Martin Hecht <mhecht73@gmail.com>
>> Sent: Monday, October 12, 2026 5:45 PM
>> To: laurent.pinchart@ideasonboard.com; G.N. Zhou (OSS)
>> <guoniu.zhou@oss.nxp.com>; Frank Li (OSS) <frank.li@oss.nxp.com>; linux-
>> media@vger.kernel.org; Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>;
>> Tommaso Merciai <tomm.merciai@gmail.com>
>> Subject: looking for working dtb for imx8mp-evk with one cam
>>
>> [You don't often get email from mhecht73@gmail.com. Learn why this is
>> important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Dear all,
>>
>> I'm struggling currently getting the video pipeline on imx8mp with imx8-isi up
>> and running. Something is missing and there is no media device visible.
>>
>> May I ask you for an example of dts/dtsi what is working with any csi2 sensor in
>> imx8mp e.g. imx8mp-evk?
>>
>> I have it running but with the old proprietary drivers but I need to convert asap
>> for testing with gmsl.
>>
>> Thank you in advance.
>>
>> BR Martin

