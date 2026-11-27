Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746431;
	b=WIawJTHsuSf9qyppXWmfTdN+uj76rDLUKUg1HU7u2j/ZDLiUOq2fR2VHYecDcKuS0B9o
	 vot4T57AIei8wJGdAy4g4S2v7JLO/jaAraI9NESLVEGQApVD2asREVSeb6cKZOYgZkFgx
	 PZXOEWbW2Fg6PZtWSMJf4vUyBIVwjericywiM8mOdASMwydpXfJ6SmW1Okpev3U+fCkA5
	 7eSJUm3ml9g9l1bItgrsnvfSlE/b+fa+k8Nl4zQERuw+WBG7YkxVb1zU69d3uw4N4SfVX
	 HxFLVuZ61lDMHmhoccxaqgiXhbQ35SM1SP7tuA/5vBqDtX9sFrnTLvR/i0IflofPbEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qRNJo2Wq+atj6dWEhKZftfAsf0NVsAUajmV6VEgSNV0=;
	b=x/QyBsIIAkhm0proxzmy+xXcfEwYoO+vLrITeEvtJ6331TTyI/MedSzbEPY3F/+qs+SC
	 Min/lks+LvTHaCOMv/jQRmkyuGcEAQx5wsZJLIFc0nnau7tCA3KdrVxeTR7h0NUIY4JDz
	 onip3OvwfXPnI8ZC2yjom+BaRdkMAuVvg+eXIuFpJtig+3A7RuBA958zE51SX2IEHQEmw
	 r+i/GcOMmp4byOumm9nehlObHRK8NW9V/foA9FpA3GY2o5lTQ1iYhbmYmBoIqWWHdMhks
	 qBSCPpQEp7jwLTgRjJ9PU37Vj4lErDM0+N78UJYW+dOnGglI6DonU4t/moBiyQx4PaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YllbfJkj;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7578D606A31E
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 02:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7578D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YllbfJkj
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso3197943a91.0
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 18:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746430; x=1796351230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRNJo2Wq+atj6dWEhKZftfAsf0NVsAUajmV6VEgSNV0=;
        b=YllbfJkj3EDXkwUCx9UTs6py3Rt7zH3anrLzdwxh6ZgzL2E8YLcaWNRjJ7xuPk59OY
         i+O+4Bclzhmf7dGV/0vASNe4+LRRqEFFbOTmaicFvFI/mUhyTOSWD3kyVVh9d7t014VP
         nvMTX86uKf2A9TS1k25/UoyZK+noL7OHfu+ybdn773/UplK20MnaTZUy7KP/HG7Lu9ns
         8d65Igo+h8tSqgtqpyoYxVN7A7VKV5MjCPBFDZyI14ivcoxZ8npDxg0GX9GTXqRZFRiu
         +Kb3v+gr8Dh6bINRaKYVFUBRg+6sxItr4HFz3uGQz/1OJ35wuLwtDbfY4p2DSRxesNkb
         /CkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746430; x=1796351230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qRNJo2Wq+atj6dWEhKZftfAsf0NVsAUajmV6VEgSNV0=;
        b=IXvFIH7N8PqDW+3t9eLkeppAOAKSO5stRtLGBLvBr90WlqRZUSzdKYA4yp8PfETR86
         E7VW+fmdi0GRx1q0sGdJHN7xGY/wCX/Qyfjj+TS5Gl05sE5o0/8osJFvl5vXuayg4evp
         G+C0OU/TOhz6OZSHJ5guGAHOaUjoYH0mCexNct7BbqDHPYi6/I9/vXid+rC4WTRUJYg2
         5ziSWOEJ0yz1uTMH7dn+XTaPIlOFSsz/dnnmUI7VOFJZi62eZWp5MpoPAM11eh/8fGaj
         S905fX/v9XtQ4pSF+mYSNEH1e1GlJ2QfsNbD6AB/FW92oObhgxpVSUjFqtVdP50SrLp8
         R/pQ==
X-Forwarded-Encrypted: i=1; AL+hErEMWPtOv3aJhI1bJxXZAy5XFTeFdhJ3ywG3uNRl+YNQgvIaQR1eFYUN6EqBWM9UmlA0Of2eYFu5UD86GQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/0XfDJvZzJcXEf+9memzg6+51ALsaZF8wQ5Yc6n+v4xrl9UnuS
	qsyP95UrHGeuoJaSnTbIBhPAtPYK7Y0NnWn1LrQ7cICDrxXaKduAcf1x
X-Gm-Gg: AZFdTZd9hKQAHcQS1rYGOiowvl8JT4kLMHCy6JypmupE74d1YjaSa3pAQOlOJljKKdN
	Xv/QWee41SCN3Xe1lEBYDmwr5I6HDw0GRyDD/wWp6K7o4KqBWIaNz9EmV3snnC2C+M/3li049co
	SVLAUQujUTFpvaO8AqQWtAUD3O4zVhrvAHuDWcktLvIYBBO2OJNjsZyARZD2mCTDXYS6vcd8Rb8
	J/kL6FOv7o+mY27j2sXsMn/swsNiBjYLGflDdEUllV2kxHg2A34yKv+b+8IpYhAVblsE3VafK5V
	mbRphAKUBEADIEkFWSpwGm/TEL6P8UybiKpVEjBFccUZRiWKEMyMLJyC3/dtA6cc9OVgiaB/wt+
	x+sJ1S6BwcQvTEVF2di/RbpT9r7fk0Tjm3x2OYU0V53YxRNGAE7Peytvr2o7477JcgYNogGhPSX
	7TAc9nCB6NoYoTjDfwDhKKKsQ5qKrP4xqNolNwZ1EUq8sqw7rQFZIKD+JMn92MVyAuQcXxkGP+W
	fFKmN03E6PGcgi6+D+lcFEmqg8EZ3PTWedMPiI/CK+3TwB6hnIT2BkfZboT/s28j/pi0asl/o47
	7yIHahBakgfy+JCHbApkIzw5+Gj6xnIokVsA1eGREeA2gUFpNHZfD5LGhhVVZn7tn01/sIFnrZu
	H9s4Kdic=
X-Received: by 2002:a17:90b:164a:b0:3b5:a3:442f with SMTP id 98e67ed59e1d1-3b500a34654mr6199205a91.41.1795746429680;
        Thu, 26 Nov 2026 18:27:09 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-229-10-180.dynamic-ip.hinet.net. [36.229.10.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b82e624sm15560039a91.4.2026.11.26.18.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:27:09 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: pisp_be: Propagate platform_get_irq() errors
Date: Fri, 27 Nov 2026 10:27:04 +0800
Message-ID: <20261127022704.685043-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
In-Reply-To: <20260630123452.14226-1-ahmisaranrao@gmail.com>
References: <20260630123452.14226-1-ahmisaranrao@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 30 Jun 2026 18:04:52 +0530, Narasimharao Vadlamudi wrote:
> Return the error from platform_get_irq() directly.

I tested this on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39),
together with the other two pending pisp_be probe/prepare fixes
("Initialize lock before requesting IRQ" and "check configuration
buffer CPU mappings"), by rebuilding the pisp_be module.

The driver probes normally, unloading and reloading the module 20 times
works, v4l2-compliance -m on the pispbe media device passes 400/400
before and after the reloads, and there are no new kernel messages. I
couldn't exercise the platform_get_irq() error path itself.

Tested-by: Roy <rongh7426@gmail.com>
