Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26F83A6F11
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 22:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785450449; cv=none; b=rGHRgnxSvlx45pEu6LMAVrQ7OvcLzRKRUQex7532k/Hap5Aujk+2K0luwYN4l+Tv/0OZ1sVrTccZnWs0UIn7Xr1JpbUumkgPrJ7ITN0onk44isS/DKcoR6rlyS5ukjBKDjX9pICgrH0E8PO0ji1+dd05fwO6j9QjkIZx8XAFNdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785450449; c=relaxed/simple;
	bh=SYPu94rj6D4VpqXcFiyvTCXbBzDx+odXwtcIp/CbQ4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jWq3AsQ14OhLITP7X61h/1MTg55qKLz/5VmjolrwORpBqYTZSF/0NvbibaStRsqs1qt36ocWEEOF/wh4uXcYCVN+TEZZLcwvRJu/H9Uiu+1UsRU1RMiMuZUMQuRxY0+mRnhdZqsb//4yDekvxJu7zFKPr9dKHr8+DMT6YEsjc+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPTSrs23; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPTSrs23"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66771ded50aso362608d50.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785450447; x=1786055247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYPu94rj6D4VpqXcFiyvTCXbBzDx+odXwtcIp/CbQ4Y=;
        b=QPTSrs23n+U2Ha/WCcEgsX/TBL0teAei0ZvY0qJUbBe3r4hh0XBn67SIBl2hCry2FA
         tpnpRfNZ5ta44df/ZtoDGLEwZxHqn9L1NeIrtDNxrtNCHv4fAjafDvXV0KGb0wm6s/Ct
         k951ZVJXfJFp8VYbjRu7UAysws9RkuwzLxuzjC6INHBDL29OufGBmX+a9F3UshiFaQaF
         rri6j16cOL3qGdBqKyQ3Vtuqx0F6cU/4QyoF8+x5o8ydIm3hHKFDimFGdheUHWZoLtPN
         i2yofsXPiYxJQPDPpb7IZ2YQB4PERmo3QBori6RU3H5x1q6np0b66I4gdABaBxJjep2q
         i95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785450447; x=1786055247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYPu94rj6D4VpqXcFiyvTCXbBzDx+odXwtcIp/CbQ4Y=;
        b=FPHobAy/v8yB9GNYuLitGhcijSu0dxBR9ju9W01xztSYrF+tnPNBHXpqeuPKWGsnFW
         ov1yrlqGZpgBVQcgBxWCHmoN7VJxZbgzbzBDJIJ54eKZp6KIID6YScsBzBr3Zc60HH+Z
         uOAKoSBs2L4OjiJE7XBKhbi/Y4Hx7NspkZBk4Q4X63Z9nnHzXPriCItAfqCJEkoNK3/x
         WAdchUVeXptIWxHKkLVu6bueM1RFJTdiZ88uIP5tDW4gvxY38NfIToWFrIRpQ/a5wSVX
         6z8ACbCAbS72s/8oUa6uLa8zVZnY3KhjHi6H3TwlEPl6ABfzqS/0HM3x4+5NvKr5t9r9
         4AEA==
X-Forwarded-Encrypted: i=1; AHgh+RqGXzJrR+Jq2vyPGAOv1kMDqvfPoprtebSF5xzR+lkvQrV1R2pwRdCAXB84vN9ckM9urpUy1n44c5wiyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAlf4ZRTziv+GjqGl19Oo//sRGtYyHrKnVt6aIH6eEm3YVW4b9
	n1rt7Mm/yvj4IKkfK5qgimwj3I6Z7ktTmLvozcyMcTWFhfny++Ce3iT0
X-Gm-Gg: AR+sD12hKSDrV17VahBSKO7xjwgsACJWhKe1DVl4MnK3Dhz/jdgxZF5rhdRXSbRuvrQ
	5A0q9VGtJUgukOLiYzLbRj5g/700znoHmUygHu17erv06gFydtuDilXfmvMtfsJDESs2aaYVq3W
	9NTPH9khJw1DNJ53i8fXh1r9kqKN6ck5XAxHs+VwjEIWTHaNH4cMGo03wFGbcCYV0ygkS6FmwLo
	MUJO47esFrUUDFO5cfRBoYtt9PSInHp/KPRzoqn5qQjbWPCKd0IEO663KUbX4nY5eaGNcx9AxDT
	8vJKOYL0SLCy6w8bjLhEy2bLIAiUX1ODvzwUcR3VKzLrm5lvUiEttYRt+v4MsIDAVeHZf53h0zK
	MlwCPaNJBlyFIpfRffFCup+KajFa13ixYP5idQPA91FUpt/vsBg0xWzJJzSCUhTIGuRJP+jNKmf
	iKBA6iTQJct+EvjHylj0y/dnmbf91Tw0UrYs/UW7e11wzYmX0qI5gY4Y0ksvyo2toAyzoHzjtj3
	kyB53QPmZpJiavQcOs6vcC3B43mu0ZcRbTdSLuuGcAhdxasD08/vbLJzf4=
X-Received: by 2002:a05:690e:4506:20b0:667:a2e7:dd3b with SMTP id 956f58d0204a3-669411932a2mr219428d50.58.1785450446793;
        Thu, 30 Jul 2026 15:27:26 -0700 (PDT)
Received: from LAPTOP-83ECOPAB.localdomain (76-204-101-112.lightspeed.tukrga.sbcglobal.net. [76.204.101.112])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6692c6e9bbcsm2182227d50.2.2026.07.30.15.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 15:27:26 -0700 (PDT)
From: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
To: hverkuil+cisco@kernel.org
Cc: AutonomousCodeSecurity@microsoft.com,
	blbllhy@gmail.com,
	kees@kernel.org,
	kys@microsoft.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	stable@vger.kernel.org,
	tgopinath@linux.microsoft.com
Subject: Re: [PATCH v2] media: v4l2-event: limit number of event subscriptions per file handle
Date: Thu, 30 Jul 2026 18:27:30 -0400
Message-ID: <20260730222730.119220-1-blbllhy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e3a1f432-4638-4295-b55d-31e2d121f09f@kernel.org>
References: <e3a1f432-4638-4295-b55d-31e2d121f09f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sure, thanks for the review and proposing the cleaner patch!

Regards,
Cen
