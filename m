Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6A23A5E97
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 16:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059401; cv=none; b=ry6XTD9oxfiPff6yDkpUj+K6zCUNEsArST1/z3AmaKTWTaW2cEtdhsEE9ykJfYTrY5R4ugjjol2Ecgr90qCkGT9AbUdYj9tCB6Esn4w/3n9zAeG44QbQGKq1ettDT2EByQTNZqia6BzyTV/OzV2UZ0p6d/qlHJSLIhPHFOElss0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059401; c=relaxed/simple;
	bh=qJa+K6whPI9dcLZghthjbAqn0K7BxuSfVMjGI4bT3dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gC4h6FZwfNyM4m2eBLy53fLCIEhmBAM0mg0IjocDoREZY6sib0HqXZjL4WvUcL9i2Rgr8ngZ44uScSGEfXUyLSVLHq7cLNxTNnQ1o/dL31I+Y4NETaSwjKr3ZRHWOfXKRxt/8Bh7j+yu7tNgf8UKor/jGXGtgrbTKCRMSKX5OGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=XVJPmz4l; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="XVJPmz4l"
Received: from mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:221f:0:640:b03f:0])
	by forward501b.mail.yandex.net (postfix) with ESMTPS id 55CAC83C42;
	Thu, 10 Sep 2026 19:56:27 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net (smtp) with ESMTPSA id PuSviDrf4uQ0-3rY3UmZ4;
	Thu, 10 Sep 2026 19:56:26 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1789059386; bh=IwYJUd4TPXfUQysgxevDwDP54YjDfhnAyXfqs8VcqMg=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=XVJPmz4lxBiszHV/+km1SNMH2rK1e4Kk458ycf5PgNU6WHZOniuC1oVWMcPm2v1KJ
	 Ok8XHQ2svIPhiU/D+7WZpwWvQAiq9gaNDSWi/m/s0F0reeWnzDyVJMagBIGICIO5ev
	 BbITS51eZWZC9CAlsvSzFIlTQT91SEM4zyPoP8p8=
Authentication-Results: mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <a3b5cdc5-4f7a-4dbb-887f-d094a232de73@yandex.ru>
Date: Thu, 10 Sep 2026 19:56:25 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 1/2] media: em28xx: adjust initialization order in
 em28xx_v4l2_init()
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, lvc-project@linuxtesting.org,
 syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com
References: <20260907102824.95222-1-dmantipov@yandex.ru>
 <7f58710e-d235-446d-9c69-cf286eae8700@kernel.org>
 <fb450eee-7b63-4b85-b480-ce8759ba7c67@yandex.ru>
 <1ef00988-51c7-47c6-8eba-95d4d2463d1f@kernel.org>
Content-Language: en-US
From: Dmitry Antipov <dmantipov@yandex.ru>
In-Reply-To: <1ef00988-51c7-47c6-8eba-95d4d2463d1f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 3:20 PM, Hans Verkuil wrote:

> I looked at this a bit more, and the real cause is that video_register_device is called before
> em28xx_vb2_setup(). The order must be reversed: first set up the vb2 queue(s), then register
> the video devices. That should fix this.
> 
> Can you try that?

Sure. Note that VBI and radio things seems can't be tested without actual hardware (e.g. just using QEMU).

Dmitry
