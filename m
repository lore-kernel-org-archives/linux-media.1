Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.185.170.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472229;
	b=m3PzvpBYN4+TiqOugfpzZ7vj1Bxs/zjDnjnuYw5GVZjyu6TkmHuhD7romK+NoSCbXobj
	 XYQj//hqmU2trBvmkOG3C2CUMv8j76FFQhucXsqzcLwIAMFUmoLwm3KdGzgEKulI48i02
	 ZC8yhlkpAK2JNx0gEZyRKbvzSl3uYDdL/Da4g7UIwlER1tzTDpnkdstTLNAXrKHR6GP7d
	 1F5XnBnV7Xn8zsYbYLhTjXY/idchpP/B4FAl72D1pfCopTGUw5qfB9ZDwxZeaGCm1ne6n
	 UMJTyA+sbxKvHCMp6+4Eh5hIF11eHEAyQcAL6vbukqfEO/0ae+g+4bIU3wyYvKXCdig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472229;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=WkS8i6SQyO64TLDO0suPWO5B8hpML+5NVYJAPf6EOPM=;
	b=DU7UtwtFPaKq3Z5a2a+JAtF8avc/Tyo2t1Rqeukx9zYNFcQgVHWA4y0lAMfzEiXDxqvK
	 CaltVSMd/rOQ4i3+vBhva7H/CUBiIEbbIV6Y5ZH2V43xrf6HvbCYlwynzoPMzV4KMSHWN
	 0y0c1rr9EiOE1+Tyk5iHEDvTqmnSE2mEsck0tsAAbxbksKiJPZ7PU06A5d/6V8bwiLa+2
	 9/8Tk0RfN1jyk7IuLLnE9e7wYaG9x1fy02szMokvUoCaW9f65FVzoZjDswYThZ7dDOJ74
	 RpQua5f13VT6ROBlvH8+ojY/sLg03cwo9cxFRONrjbMtiY46F2CXXMR1K2xE0h8sLQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=iki.fi;
	spf=pass smtp.mailfrom=iki.fi;
	dkim=pass header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=Wap1HUo+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.185.170.37
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8E0606A323
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 08:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD8E0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=Wap1HUo+
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4jQD9935ljz49Px4;
	Thu, 12 Nov 2026 10:30:21 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1794472221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WkS8i6SQyO64TLDO0suPWO5B8hpML+5NVYJAPf6EOPM=;
	b=Wap1HUo+aNK1+smUunbR7XRla4aOl4Y371H5dohHXsfahsKdce6OXTm74SnHMN2vwgFfXW
	yfnwK9TNzQSlmVCOZ5kAcVJ6AD72gVy1OkgSQ7SsKKNYbD8ZRNviaKEYKCpKHhTX4Q1wI1
	99smB0Z9rPQr7bKIyqGD674aCUvIsLPgGP6LXfW8/n7zn+URgEkwo2WmrgWhJRqbf3PIy5
	8vcMkrwkMuereRPLyxvL2ilo0xNDaZ/ZrNOWMSf64Evk8TDBAhKT6CD7t1xo9BNk0myuk2
	WLGsgigmAE6Dvj4Kwlg6XI7J8suPhISsUdUMA/b8FXefcBq3KsFgeHimK4rchw==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1794472221;
	b=RvsnsVZZva097sQD9lS7YBqweWEuC4LlaDyzkBytGQE1XqMKF1rfO4Az0iuPHoAkIhjIW2
	1Ui5/1nB8TNpo+cVOEmybrDMGEyTFhcYcGbcbaZKYiGLlJfGEzJePSQq5GoSCh5RxPXapY
	ojNG9jn6T8+Sv+BftKyEWgIAxAeF9Xn8ad50beQraUB4ym0IBpFaF9GNLFEV8+aljed+Fo
	cbIElnkQwCo5HHtGcEzdMhZNQCal2SW9dAN3L83UK+FM9YJctOrqcGddPoy0B/cIde+OOR
	zuuCBvbXaVsA8hZpwKAKSVP03NbsQvhIYVpDlh9bh3jJbOfW3ttY9hhix6KNhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1794472221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WkS8i6SQyO64TLDO0suPWO5B8hpML+5NVYJAPf6EOPM=;
	b=XXY/kGFuwR5zQxFlA3Myu2ftbhdZb6heG1z6R3tO3l64I2kSz/Suf7Kf/6q5wxSf6Vtbez
	iyGJSOBnnlC3ntfrKVTp9sJOuCNSLjDokFDF+PKcqY/wpNB1LFBK9GGk1WXjBbZ1v7viQv
	XUzxduBMN2qR2/PY3MQAw1Uzj1E90bAcl/WtDoHiXY9rLK+qunldYF7cIqh8yDap/pQHwE
	QAKlu43W4T+KruAZIbcFSD9k1ROXFWFM52YugD2UQ8PXbFhwxe7KIxZgeM3wRfkLzfUpRH
	jf7PwVzv/n/rEmAVV/pspORGUqGXmC8OtkRveJ24JL1npENJa3GljYyHWSaJGw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 182F4634C4E;
	Thu, 12 Nov 2026 10:30:18 +0200 (EET)
Date: Thu, 12 Nov 2026 10:30:18 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: hans@jjverkuil.nl, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Philippe Baetens <philippebaetens@gmail.com>,
	linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR 7.5] AMS-OSRAM Mira220 and Mira016 drivers
Message-ID: <avV5GnrkrOIKQOT3@valkosipuli.retiisi.eu>
References: <avSh-mkOAZpq6swU@zed>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avSh-mkOAZpq6swU@zed>

Hi Jacopo,

On Wed, Nov 11, 2026 at 06:15:13PM +0100, Jacopo Mondi wrote:
> Hi Hans, Sakari, Mauro
> 
> The following changes since commit a083812f66fa52c59fb0ee25377180a645e5970d:
> 
>   staging: media: av7110: remove commented-out code in av7110_hw.c (2026-11-11 15:21:53 +0100)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/linux-media/users/jmondi.git tags/pr-mira-for-7.5
> 
> for you to fetch changes up to 62b600ba608740f3acf56b201387d210bd7d150b:
> 
>   media: i2c: mira016: Add driver for Mira016 (2026-11-11 17:52:49 +0100)
> ----------------------------------------------------------------
> CI pipeline:
> https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1790534
> 
> libcamera support for Mira016 (Mira220 has been merged already)
> https://patchwork.libcamera.org/project/libcamera/list/?series=6344
> ----------------------------------------------------------------
> Jacopo Mondi (2):
>       dt-bindings: media: i2c: Add Mira016 image sensor
>       media: i2c: mira016: Add driver for Mira016
> 
> Philippe Baetens (2):
>       dt-bindings: media: i2c: Add mira220 image sensor
>       media: i2c: Add driver for AMS-OSRAM Mira220

I'll just pick these from LMML if that's ok, I have other sensor drivers to
merge as well.

-- 
Regards,

Sakari Ailus
