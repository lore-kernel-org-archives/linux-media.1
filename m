Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795184853;
	b=KNH6uryQ+9Abjcyk/w2QwTEhRLgcuF0BEutcZTGPPpmUtjVTdEkNmQFepHN6u1mW5Rjz
	 OjfnIaumkpzg/xwWG5wdIL0VlN1/4OvmCsh3xcdiBtpHPNB2bMrgjVWeYj6kSCGRFjrx8
	 BHyyrDIZdnSEIIf0LbPZJNS+p1rgXmw4PszkVCL1hzbXjsJ8WxlmKr0/FSOMN/3nMxCeE
	 EgNxjpfm8SDKhgKHR7Bk2GUCwAlTT3PfM5c0fjOD+N5DOgA37NMvy9QEsgZ4aFBG/i9h0
	 yAX6zyFvmHhvw4N0Sla27lGhCPrQkza8JH301thje2u3gg1Khv2+vdsBD9ssHEIFXlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184853;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:Cc:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=dIW8l1jmAMoopAylHO4JbVjM7+yfy0/+M5N9pT2h0sU=;
	b=UJU+wP7MNCOxLC5Yhk3ieKfvZjXlFnZ+f8Fzr/l1wNP4ioRCYe7Fu9UZc1008G9sC0/M
	 HRvjekMl2ycoXQxQVigTY/KQzoQeEyz9Hc38p75QTFMnB+l6FJShL7Q8Vz3/HkWgahAo4
	 evdKZCY2jsslvKLDfm0pU5b8us0tKE8cO/8z/EXVuFM75SCtPuX6VhDvIdQ5tGHPyF+48
	 gtB0malmJAdFWkhcUUlBbffUu9rfGnsHgApzRoolkaxGIISJzZ5p1ZQZYdxOp8x85ztx8
	 FPNrtYbDUxHS7HmAbwmkiwz0XTlfekVj7YMyutZfLskRjIEbAYI2ZfyljC3igSEO2jQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=RGmBMqLO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BB6606A325
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 14:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3BB6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=RGmBMqLO
Received: from [0.0.0.0] (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: spu@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EBD1B20102E;
	Fri, 20 Nov 2026 15:27:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795184845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dIW8l1jmAMoopAylHO4JbVjM7+yfy0/+M5N9pT2h0sU=;
	b=RGmBMqLOUbeSR1o7Q4vmacQFs3/oB863tT2tuqZxcs5V3hjiJsxm1Mqar8TCKO/tZ/LBBJ
	f5h32ISXoDJJO+0mwCbm6GkGCDgZl3b8tyzGMxhESiBK/a/tcwRsuITqI0re9gdYPno2yP
	VIyrTwSuoBwuxH2XLEilEhEkzxgfOdiTIW6exK606cNXGnO3q75y14IZ+Sz8Nwoi0XI5H2
	Y+i+UWnCGC5orvbc6RkbhrNMYQeCUsPTS4kQAd1JfMcd3q87YEqHeVYaEVN6Sxkj+UmulV
	3HzrQq27spT+rZuNyXdbI4AiptxnA1/iuYVl7EBAF7soE7pYMvWfA42f5KZ7EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795184845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dIW8l1jmAMoopAylHO4JbVjM7+yfy0/+M5N9pT2h0sU=;
	b=XOKrUwWWgDc/384LQ7JXk9MU99nTXLVXrARvYhlK4m/qoPItJudsSu5FDd38PCfvpi+dPg
	zRYVyOpU0qel4wwu1Zi+NEwcd0liOhrVu/m9IMHDcLCHqwQ6qUSCKMTvOGWlxf3U49F1ZV
	DI3R9U8KYAZzZM8+pZMCYLW9et7LN7En0VLBypaL8Uv9s8Q18HLpPBayHLRrSsk6FgQl2x
	ni9kepTWPzI0k8MsrK1iR9Z+sRcjvktazZ1vD71wBqSJ1dp++CO83nsnhBucjdqUPsuzxl
	66uiZLPfCIeUOVFV5GzhL4E2nvz2poBJ6DVGc3jEgO89jAy3kLX9ZgWO9fnjtQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795184845; a=rsa-sha256;
	cv=none;
	b=LqWWGNn9wCcQTmS3zB0VAck0cBTStcsKLLkFrad1bl+o6PSv6rb4cb/oNKMNvKfwzklb83
	31gPruzsHzSuHPrsX/JiGdw9fqEDMFn3yfB53Fsqhwa+nhtAWQI716jcuOv91XpotEjj3k
	6/LnTh3DC448MXLEdmpGDJ9WBWjdslVmIV4ocnQ+E9TIvTMTWD4seq/hY2SGlarWFgtIkJ
	/FI/gUQxaEDhI8Ik0PjYWTYglWW/buNOwL9tMpo4Y1vzpqNulL+maU52l8MMUtDCl09KpY
	dB67bbdNoEPLVJe5M9dkbr/xjyeVcjXq3kTsyCLtt7tJHg+3SrdUJe/LidEk+g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=spu@pengutronix.de smtp.mailfrom=s.pueschel@pengutronix.de
Message-ID: <00617d74-cb47-49b8-af46-b3d93607e730@pengutronix.de>
Date: Fri, 20 Nov 2026 15:27:25 +0100
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
Subject: Re: Anubis challenges blocking file downloads in CI
To: linux-media@vger.kernel.org
References: <3539F6C5-63E7-44CF-87BE-FE98FE8BD588@aosc.io>
Content-Language: en-US
Cc: kernel@pengutronix.de
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <3539F6C5-63E7-44CF-87BE-FE98FE8BD588@aosc.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/18/26 05:34, stydxm wrote:
> Hi LinuxTV team,
>
> ​Our CI pipeline is failing because downloading files from https://www.linuxtv.org/downloads/v4l-utils/ triggers Anubis challenges.
>
> ​Could you please adjust the configurations for direct file downloads via CLI tools such as wget/curl?

also stumbled over this (with PTXdist). For zbar I've switched the URL 
to GitHub. But for v4l-utils there doesn't seem to be an official 
(GitHub) mirror.

While I could (like meta-openembedded [1]) do a (shallow) Git clone 
instead, it doesn't seem right to me (as it produces more data and 
server load).

Maybe just exempt the project download dirs from Anubis? Automated 
version check tooling sometimes uses the directory listing to detect the 
newest version (Anitya for example [2]). I'd hope that the whole AI 
scraping is smart enough to only try to download each of the ~200 
download tarballs exposed with a dir listing once.

Sincerely
     Sven

[1] 
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.32.0.bb#n29
[2] https://release-monitoring.org/project/9998/

>
> ​Thanks,
> stydxm
