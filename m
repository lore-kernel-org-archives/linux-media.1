Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A90448B9D
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 22:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189521; cv=none; b=ta3fky0OppOuwNiGbMXS1BFpcR6OgnS0oW12gk+8gDkrXedHDjTb1Fdeg2RQRUbhpPuNB/cNT/9E6MvBCgxVuECOPuFinCBnLgK7ZFVvPygxpTKpzO6GcSZ768GMLFcPv62t7uhL3v7sOr7+GR2lJu5V8LSndSllBVvDr2SB4tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189521; c=relaxed/simple;
	bh=wr8nKQRVMvFmNlpalpzhVjt9cczrfUGnQQrpEM2oFRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gSrmsjuA1gOocAERW9yZU7ISsbszKlEUs5dXYe9c7y7WEoMDgPfUPF/Nc2h3u7Kvu/3hC5TWMlzSw/RPVVOPamDK1zvcacnBexaf35UEYqCTdewtKzRvUenrk0b1lJkNepj6ID35ePIDvPJGjq+tFEbVuEPvpj0XowL4+RGTqRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qr2hZr1W; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qr2hZr1W"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so3816815e9.2
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 15:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792189518; x=1792794318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0gV+4463GGhxnl9k0VDkO8zdfsUzpizNELkAcN9qFo=;
        b=qr2hZr1WF/DP6wPL+hw+wF0r2KgciwrvMX7JpoPPRXhlBza/77KO0U0AIrQ2chLOzb
         3/H/vTbhphBptrxbdoPTCjNWJeeC+7u/bYIzk/2UvpRr4gXvFBgxhxqQ2gRI+jY2WW1A
         QN9VstdCGxjKclFme4TEqoCpskxWZprwcR9Vh0BZF3WH+65w8Wyd2py3EWqWyPYtNGWg
         a1IjF4D5qj4XNjwsB/SKv5eqa1HN5j2BIyEz+zrEclGwxH220N8R9V4BGvbWedkjY1JB
         LZ8wITZ9FjYNgp8McKJyuhWJz2ep3xSr0BFmXGVn4B5nR3cOoUvqJEOs3scFS/WJBqIx
         ePWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189518; x=1792794318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0gV+4463GGhxnl9k0VDkO8zdfsUzpizNELkAcN9qFo=;
        b=kc8fYKjpB+ou+roVHojCrKeWMXyPpju9MuIOcdshbm0yOMlUMcc0wN5gVH5X+Z6q2S
         anbU9k9vrZkPMJIkIwAIGaWiyypnEufM2xOuBui4PlCGubFqeDZoRFBC/3WxKyWjXBIN
         W+pnZYOwEFfoHdgkCFUFYgGbFeacRJnESjxN1Mv6oaIVAaX2P37W4mHead/13K65KXXs
         LgEMjCMpiCenYTmMvkYJq2VzRtzY4FGcwU7S+8bjPycu1aJqR1cE1UQGTXsIIHrKle4p
         GJlfw7hTNXKVKHUdj50VMLGUHSU0IT6Gu9t1tXT8Uzh/U6I78c8UkCwjNs+3g4cPLLwe
         e0xA==
X-Forwarded-Encrypted: i=1; AKwUvBxGIR7OPboTG2S1dvSzYReEVZrmMBbqyzko12uFMes3Q2Y7GMtE6Po9ly05atb6bTsQufGwKF+szCwFQA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLhAemvreZ3lMUDcqHeD3tWlGvZwis7z4Z7RWG6qLrzCbwyJ/Ug
	2206XEHuHOzlJeAPwDllde279yOwRJG1DTTBAbWOmXNgNyss4SDaeg8O
X-Gm-Gg: AYBFou1OeuUfae22Wltj66nNz35m/M5OGA89uRkFIHLMcaOUc0diWllRGUytv7JEr3F
	iJ9aZQWSNxeVblRxQULoZdvs6Ji1QoLixEZdNcyvKYDZm3Ik2q1pwpR7PhnssHQKqkh8rkwdFJo
	DhedcU0uzwkFHvVoN12YyFPcaUu4f7zF1UeStTYfD4ro/JjWgLYnWE7OPI7bPdcgMVzTTNenN0M
	b5TgUBadRRl3hRk2m3I1V4ibRrdn5GVwHeXKA22pnelr+ihcfk/TdNn816y0PO51chbvNl72I/R
	8YU59kNOccxZnO0TGvOGH4jjQ86t/1tks0HluKL0fhW+vsJQ7uBod/z2loq793fkx0CpfB9uZwa
	qB3vLkRuF6KTkpw1mmcmjHRjwxWUSl2W4R13iirVBj6pqCRDD10brXUSCSOXSEgY+dMjaC2bPFd
	TEOcTe7kD2sC50ZIfQ3MRpWl1JoWj4RGNdeHgEYRV0NH09g2ncorJdXVTcRBXJNxeXiU4IpsBA7
	GvaEXSDd0XQ1AUmU7Xae4XzuYGMsqfTDfQPHHx3qqZQHq50CXqDxDhBmtx8P2WatblBibtI
X-Received: by 2002:a05:600c:e54a:10b0:4a1:a475:d885 with SMTP id 5b1f17b1804b1-4a1d7634d26mr15613985e9.34.1792189517741;
        Fri, 16 Oct 2026 15:25:17 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4feb6bsm8149752f8f.41.2026.10.16.15.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:25:16 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>,
	Bryan O'Donoghue <bod@kernel.org>
Cc: Andre Gilerson <andre.gilerson@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] media: i2c: imx681: Add C-PHY support
Date: Fri, 16 Oct 2026 23:25:13 +0100
Message-ID: <20261016222513.23355-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016211450.62994-1-lsa.uz@pm.me>
References: <20261015-imx681-x1e-v1-0-fd22f5f3b0c5@gmail.com> <20261015-imx681-x1e-v1-2-fd22f5f3b0c5@gmail.com> <11f1a19d-7d57-497f-826e-901f9f88b99b@kernel.org> <20261016160853.193378-1-geocausa@gmail.com> <20261016211450.62994-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

On 16/10/2026 22:14, Sergey Lebedev wrote:
> Either way it does not show C-PHY here; your reading on the Snapdragon
> model will tell whether the two differ.

They do not. Read on the Snapdragon model while the sensor streamed
3844x2640 at 30 fps over one C-PHY trio (linux-next with the PHY
series):

  0x0016/0x0017 = 0x06 0x81 (model 0x0681)
  0x0111 = 0x03   (CSI_SIGNALING_MODE, as written)
  0x0114 = 0x00   (CSI_LANE_MODE, as written)
  0x1600 = 0xff, 0x1601 = 0x03, 0x1602 = 0x04, 0x1603 = 0x01

So 0x1602 reports D-PHY only even while the part is transmitting C-PHY,
the same values as on the Intel model. The capability block cannot
confirm the mode on this sensor either way, so I will leave it out of
the evidence in the commit message and say why.

Thanks for reading it on your side.

George
