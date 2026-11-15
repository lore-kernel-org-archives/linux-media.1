Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794731194;
	b=FtQxogPe41UUfX5KKUZItVHBgKacjPQ4JjbcknUMj4Jgn+ntAWdI39i4iS/McQorwEdE
	 tx2jCUq2TcD64UtAAWuOr3WdwSS+4FkV4Pl4erggRFugXMHymXUVgqr7zbI57vYKntrr/
	 bW8sa14wods9Oy3y6wEAt4QjsyXlFr/QuUevktsXp9zFkM+K8rvoaLnIXHTgqa5KIIxy1
	 cJL+QbWurNYVyYBKva3YahapOivRdIdOjbjBS6u0aoj/+T9jtRiaxC5G0Kt7LqBJLXEmj
	 2R7LDm6RJmskckH3l8MVIfflfTE3ACRhkhZeg9NS4nviMzUrHvKTXDXRa58yHuzQKzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=AEWA9iOD08SFA/zlaE7wGAZjLwI2QLYLqoPd1RCuPRs=;
	b=huAYCVNr3U1egfd7HyQNDxWGXPLAdY+75eINIh77aWFxaCvqXU78E11TV8dpPfM9oe1+
	 obQMVlQh6xqcArmYPmb6siXJYQkBgGfg+/74cLbQ7KUXyffw4I81oWE7zXyScR+nAn83j
	 YCyxVsxhiqivTwGqi2FUzuXBOrKQuaIAflUdtnDmi91mYdPTwfApYXiUoD6yT3RYd/UcD
	 w2Mv4UrvJEM37jWIFz8/ABbpcTihVqhk/BRQHY1SRXGjcVHAtTe1u5gL2YyxrG0PkYl6T
	 XhGvXDV+pIgMUrD73a7iFdhkLQlkKSh6Yc8Ybk2autrdMdCuEjtcxZKFl+i+mtsjjqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tbmZxUl/";
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0FA606A31E
	for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 08:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F0FA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tbmZxUl/
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0d09fc934so311934a91.3
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 00:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794731194; x=1795335994; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEWA9iOD08SFA/zlaE7wGAZjLwI2QLYLqoPd1RCuPRs=;
        b=tbmZxUl/qesdX5+Syl6V7aTnMIAu2eBkAVoROlQBr8b5UmewMMSHNpwUV9XlVDvJ+b
         g+ppXiGL+7qosPUNsyJ/TE4nDKtdK0v5hM8fkk425cEFVFF6648Exbb5xS6NgkcgHBa3
         P9clhMz2FmXEYJpFe2asRWs6JlSXYT7tuumGMQnWnqpF+s7u8NpJQlo0gxCp0D6hbsar
         +bjG3AHdNFvwcxC4ZHNE7m5IiC9REkzUdnz42HaKEkJvM5clJAgBDuh+WlLKlU1AwPVr
         RcFX2iBSak1NAAIrH+7fZ5C+MD0wlnMuopRADpYvditm0jx7ZrV/ZjXoe9hG/LB7fpRA
         JYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794731194; x=1795335994;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AEWA9iOD08SFA/zlaE7wGAZjLwI2QLYLqoPd1RCuPRs=;
        b=BT3WisCVNnwxX61jkKLZ1fB7Tsvjd2KT4dD5ESkx+0fN8FzPyuV9W3AW8JvGPHUCh9
         Xe34DhVuqoZVeEbksEcy/FvwF13eKBnkpoYE1WPdqtAx2jCB19BKkdXypTtia2r+CVY9
         Ga2edn/s1RcNDy4VqZF65reUT2wLkk9Vi74MKa+l/70YiVwWLN4YwLaey8qRDZfkB63G
         FJYz3rAh0H0ldmePsxfGg++4cYo4PPdZlD14l+23DOOkPgoW+LVSUmfXEkPqrVfNZ9tg
         yqVPTXz3PhxXBma+p/RdoogDfEQwOsQflABBD3xG8lBQ6KXhRkC2eaqmX5Ji5Nwi85RJ
         rgSQ==
X-Forwarded-Encrypted: i=1; AL+hErFVZFcHhBqxZRB2UIQhKnOWjx9sqZVZvr33sg3I50tcdgJierD411NWeBDlSXVUMH++H5XqT+AV5dluPA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/GcG49HJhcc/gUGTt97ZOAoa7wGdLt86RSFXqSxbICcVq4wfHp
	wcvreaqZ1k3njIYK4nFKqm+sWclZubmC/QYmKTzu/i5nCsuwT7nplrcm
X-Gm-Gg: AYBFou190BBtla1Yo576wzMCdprXvthhiTVk2nUIIOmppEX9cA07wMwmft4EgiB4lUB
	5jdIrM1df43VqU/6ToWSJzdBrfiXYoEciUk35drjP+tJG2iqUP9DJLFW/XTFYvHiJWdGxaCqEIG
	r/i9R+1R6z1lqvd/kEDChiQq/ZWJepnifHS3bMyUA5gFhTyutWho7+HuQfTbnnKy1zoJJn+1msd
	d9TVZE+moClIwLLTjtGyPtI8USSpSan+Nm40WIwEEnpW2A20jduNL0Mi8ev8qCuQwfNmNdmV8zU
	7NjvXkWu8WBfud7J+Nvqy6TU5SVCBe8KGid4tn+RsxcVudl9lBvkBg65MdcuMLa602XOLAXVQcC
	5r5xGcvfSPXNI2AgNHxTk+wiaayFDvn/Ct/C0/v0QfgrlJS3a044bwwO9EeA/VPPl9K2KxPRO0z
	t1zHCkKGDqrd6m5VnzH/g5iDfYttgtmE8rjAbZQvS9l6NfTg+L7ta8gQygEPmoqM10UrEIZJjPL
	QnSVCVz2/DulNk0BSAIT82NMeQiJAQUakprYgPfYC0Ml1ZDrq5s6z9xmAFssIIQeI/xJ4LaTRvs
	03j+az05MZg//2JQIL2NTWWvPHhsqxLJ69ShYMohp4GRM9CIrWpxkgPs79OIS7oT10pFBNQEBAA
	c/98aMw==
X-Received: by 2002:a17:90b:568b:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3b1b0815b27mr11488600a91.1.1794731193623;
        Sun, 15 Nov 2026 00:26:33 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm12961779a91.11.2026.11.15.00.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:26:33 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Alex Kazinsky <a.kazinsky@ideco.ru>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject:
 Re: [PATCH v3] media: rkvdec: Handle interrupts without a current context
In-Reply-To: <20261113102456.4155237-1-a.kazinsky@ideco.ru>
References: <20261113102456.4155237-1-a.kazinsky@ideco.ru>
Date: Sun, 15 Nov 2026 08:26:32 -0000
Message-ID: <179473119253.4041300.13173694154528880101@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Tested on an Orange Pi 5 (RK3588S, VDPU381): 7.3-based kernel with media
next's rkvdec, this patch and my watchdog fix [1], KASAN on, 4K HEVC and
H.264 decode with the watchdog cut to a few ms: 5955 timeouts, no NULL
dereference or KASAN report. I did not check that a timeout actually
raced the IRQ handler.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>

[1] https://lore.kernel.org/r/20261115-rkvdec-wdt-stop-v1-0-59e687c6cc63@gmai=
l.com
