Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726A42367CF
	for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 07:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786865428; cv=none; b=MV//IbctwoTveqOit4qt+KzAMbCfmsILa/CTJgEK8RwXZZZvSL70gVP+Gl5vFtt1LvL49shj8Q9WxKYU7lv6Pn+GPxAt8hjzvOI+Xzi8YwTDqf2RzUH/Wd0H4R6zWx51TrEYUo2kp2lg5tXxk6rZ4zd4NZA5bTheImCzrY57u2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786865428; c=relaxed/simple;
	bh=VkHWzzFjFsD0isDX4WgpLMmqZFoGCz5MQKudd+quF54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XPTndhPyONkKs+FrT6QSrMpWK2hdFJP6DZMJDs/D0xP22AZj76xX0z1A1LbuL2dYM3l4U0F4PwD6+0rIZXwgNa39n17lt42/q/QmPSKOzrpQYP9ZlxbOxvfIn2pWS7x2kbDyN4ou8Z7UmGgHkFWtmGlqbmX3H4Zs6WHoskKGRvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kucmo9XZ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kucmo9XZ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceab75934dso29358815ad.2
        for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 00:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786865426; x=1787470226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HUjLyrFKXdxo7BCne8VLDtxVKKQrN8yD6zGh8EQT42c=;
        b=Kucmo9XZKnz1T3hMlf1XTybcNW3t/Zf891w0VuznqZwrUBMcuX16pKOvp3bugFWUBd
         97LgeL1cWypKOM0ONf8t1BlI1cvVtvLObxTIL6YuKqVUntHwFpjeC8uPsHr6MwL34Fq4
         1cz0Jpa+6NwYh0g/JFpp83iSooHHuX7pyV8xXV2HIZpDFvjkFqXJpxoOC0bMzjUJb8RS
         x6rAn9EdKj6GvbgXBrw0+GjpkGeY3BTW3BLOUtjfvdfXWWRUN9sqHfpWDlnIr4eN/5Rf
         eJQMUZpxiG9+3vcvdtn1FeEv4nxWl/Fmb2TtGzQ/EwiGtHO0lUG3AnUbbstywAxmnkGl
         fRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786865426; x=1787470226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HUjLyrFKXdxo7BCne8VLDtxVKKQrN8yD6zGh8EQT42c=;
        b=rY4C87YEA95Kl8wwWaMLLul7iCBH/3fuduwmq5EcyMvDNyN01M3ktK3wg5jhMs9l4M
         YH6fyjG3Lr8p3SmIlHyNh8QeMYh5n6KrHCbJyOO/cr8wfKfAIsA5LYL5vzb2gErXyA3J
         T3YBtGIV7Y/z0Rm6N5Rp72WgZbpK70o3cZkHXkGHH4ibp0lvG+08mVR0VcGmWrb2yDrS
         Tabo6wNLXqQZNtRq0ZcwDPdJhInHPuH0xcDeqZ/5XuW4WlgCikDP1XToa9OqZZLkb1GN
         u8c6EWtxhcp2Jgy2tb8bw7UCOyU8EGvC8IXjRvw5MA9UjdSqyoRlSUu4w+vAq+vnGQ2z
         wG+A==
X-Forwarded-Encrypted: i=1; AHgh+Rqsv46MZzbZv26o7UMRqq7zVnhBoBJRFd8H42jClzvLnYuKr1rcCTWtMGejg1Ftxhdtl63WdrhNCksxsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoubCP6A8ZlFRY6p4UkNu0ImFr+f2ntJyfNL5g8K7euVZFeCVe
	g6n1A1ONWSLjDrYaNV/edsStWnhNUFfKlM1A93BRlhC8qFqYOVzgbGnE
X-Gm-Gg: AR+sD13QRdLbV1NlVrhXihHIIHbldzStPsrQxB+uk/4zDkzVZqwvkggaV/sD5RSkxc3
	1b5wfbVZ7x9D01lAz3T0A8trzdHIxMejgH2ws5zpcOZHZ2te+XFAvbelzSo+BbvStiXafgWxQN7
	TvkdGI+/ITmiP2qncgvcEoAhSG4Epk27WZa18N7bOgnQ2KOM88qqkkq3rKl/pmxD7I0vGzb0xEN
	fxXH0Ds7/CC3qel5hl+AalxmPZ4ciVNisnReCPcuSNRBfyjAukox4FJm/FHnRFzqrf+mfYRd83p
	YQeOE2ffh653Q1XeIEZVAvSyTABiWfR+vaoL5qc/ISORR/vX2WcR0Kv/lbGhH1eANOXG3WpUpN+
	vVv1/ERh9JmDsX6vZnT6qqOzXfAVo+mz/URl9kNwDOVhsMHHX/QefQ4IO+cLHQ7IgBf8WJzPiCz
	NOTCpDjG4LnjAIdZMFarEWQGpjwuD0cxdJf37FB2JV8PZJhdDeu+LQ/JSHotzohTp91XnyIcOA+
	dPOSISBpEeoRPj5KKx1OtVp
X-Received: by 2002:a17:902:da8b:b0:2ce:f9db:a9e0 with SMTP id d9443c01a7336-2d3b0e99809mr174012975ad.16.1786865426532;
        Sun, 16 Aug 2026 00:30:26 -0700 (PDT)
Received: from OMEN ([103.148.21.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd9fe0sm37303832eec.1.2026.08.16.00.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 00:30:26 -0700 (PDT)
From: George Emmanuel Thomas <georgeemmanuelthomas@gmail.com>
To: pengpeng@iscas.ac.cn
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	George Emmanuel Thomas <georgeemmanuelthomas@gmail.com>
Subject: Re: [PATCH v2] media: ttusb-dec: validate command request and response lengths
Date: Sun, 16 Aug 2026 13:00:06 +0530
Message-ID: <20260816073006.255739-1-georgeemmanuelthomas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813150758.16500-1-pengpeng@iscas.ac.cn>
References: <20260813150758.16500-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Pengpeng,

I tested this patch with a malformed USB response that previously
triggered a KASAN slab-out-of-bounds in ttusb_dec_send_command() with
a reported read size of 75 bytes.

With this patch applied, the same reproducer reports:

  ttusb_dec_send_command: invalid result length 75
  ttusb-dec 1-1:1.0: probe with driver ttusb-dec failed with error -71

There is no KASAN report, and the reproducer exits normally.

Tested-by: George Emmanuel Thomas <georgeemmanuelthomas@gmail.com>

Thanks,
George
