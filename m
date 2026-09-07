Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0344C48D868
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 11:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780622; cv=none; b=XsuVcC5pGzUSjjfm3IPhSs93BIdPOUdSgAjYH3+0HfyiUYVmEs7YZD8naHSHVVdPKxD7jeUNcnY5lL9+dk3upPLgD6Fyv6rxtu+B8k9WCwM7QLpcjgoCYee4DTYPJ3rkKLUgoY2CNdcGjKpCDA+ycYtD8KoKXqftZV4ZynVVGYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780622; c=relaxed/simple;
	bh=eQ6ihal2/sJcprbABu5OYKkVHaoSLfYf68qecorqY8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLn4y/Bp+2qB+Yk0wIlTNXHStHTpg1eVyNvtPO9lXHabdon/12G4M/8yutqkXHtJxejKzK73S8o1pUrMa7+OLAhhrwjBtNE3/DBH9/iTAjgsM3ed1nVCSnWMsj4yrm56qhbaEep3y1J4j+fG1J2ApiwO3LZDKckPeDOPG0dZvdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=T3HTEsJH; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="T3HTEsJH"
Received: from localhost (unknown [10.10.165.31])
	by mail.ispras.ru (Postfix) with ESMTPSA id 2BE0D40ACDE1;
	Mon,  7 Sep 2026 11:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 2BE0D40ACDE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1788780608;
	bh=ws4WVJX1DpAmuzqaEFaxe7lPdhu86s/iD0+0AJQZaHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T3HTEsJHnfOkpmeadjdV+stq65r2ZP1CPdF8Gl/s7LRS3dTP+LnX9MWXnjxm8lnGB
	 R3KH0xBSGovPNeU+K4Wb95cHo6Kqr8ru3ea3c4YbfbHd6umeULB6E4vVMBAFzEZqoU
	 6/tvy68sPUZ//KbwQNZ9yorlSCYp4uaiHHz+L2Q8=
Date: Mon, 7 Sep 2026 14:30:07 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, lvc-project@linuxtesting.org, 
	syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com, linux-media@vger.kernel.org
Subject: Re: [RESEND PATCH 2/2] media: em28xx: fix race between
 em28xx_free_v4l2() and em28xx_v4l2_fini()
Message-ID: <20260907141901-c37057428f7d37dcdb29b1e5-pchelkin@ispras>
References: <20260907102824.95222-1-dmantipov@yandex.ru>
 <20260907102824.95222-2-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260907102824.95222-2-dmantipov@yandex.ru>

Hi,

On Mon, 07. Sep 13:28, Dmitry Antipov wrote:
> Take device (an instance of 'struct em28xx') lock in em28xx_free_v4l2()
> and do the same early in em28xx_v4l2_fini() to avoid UaF-triggering
> racy access to 'v4l2' member.
> 
> Reported-by: syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=dd0f06181ab66b93dc00
> Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---

It would be nice to know what is the race and what is the root cause.
Since if em28xx_v4l2_fini() and em28xx_free_v4l2() can _actually_ have a
race, it's not clear what happens in the following scenario:

  Thread A                               Thread B

                                      em28xx_v4l2_fini()
em28xx_free_v4l2()
  mutex_lock(&dev->lock) 
  dev->v4l2 = NULL
  mutex_unlock(&dev->lock) 
                                        mutex_lock(%dev->lock)
                                        if (!dev->v4l2)
                                          return
                                        mutex_unlock(%dev->lock)

What about the resources which em28xx_v4l2_fini() should deallocate /
disconnect / put ref / etc. when it doesn't return early?  Are they
released eventually and who is supposed to do that?
