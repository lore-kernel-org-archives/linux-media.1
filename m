Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F653812D1
	for <linux-media@vger.kernel.org>; Sat,  8 Aug 2026 16:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786207187; cv=none; b=jeqxaTSWOk2DuTE0I1IWYx+hPrAdvPjLTbXqKDUtYcA/rYYo/44825qOpcQLr9QjdpwVdxuFrjhTJGg1tMFehSLQNOAk7hh3qCcrpR10avSXNYIOGmonTmQHZEXU3wwsyhEy1xNa0oHTy153gewHjBRkSPO0FGVvhZ6xdIH50rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786207187; c=relaxed/simple;
	bh=OZT51qHrYgQnWWXcqf3U4YiUd+vws/gvgF5A+hfVeak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c+6EO67EXLdxnykp/rfDKiANga4xjjjUl2kyaRGa8wPzdYckZlLwhUcMffN/H7taY98ROFVyXvuDeh4P0fd+N8h5brd88Wx/uOs/ayn9kCu7jVN5L7pJmehhi1nGttE2GzflkErdiS2XqPrej1VMFg4gxEadGBPUs8EmH5M9fXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtF2Mmcq; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtF2Mmcq"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1712a04ddaso69298966b.2
        for <linux-media@vger.kernel.org>; Sat, 08 Aug 2026 09:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786207184; x=1786811984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZT51qHrYgQnWWXcqf3U4YiUd+vws/gvgF5A+hfVeak=;
        b=EtF2Mmcqbo8hxGzZ8rhP0RTsa01Bshjq0l98sg8zLvP+Q7QjnI8T/LY+lu5uYjQzyI
         Fqb0lV9QJeKULJH6AsubBKXh9A2J7Xr3Moy0LQscx6bbdv5q2ePWKto+DYRUStN+RULi
         v/iApXMv0i0xpgCRgA1YsEBV5GzF/G0Iw5LesTzd5vA35UBfFlowOmT0JFEokHaC0MRV
         B1jUD79pA0nrlD3yX0BPEBAbOMhvZua3bMd3/wZsaEKE6cg8qSIepYtTl//C+T7TX8gm
         t182VPB+gZtp0o7P8RDuJoPjjtXXUy6EZUAFdNcxkDCP7kyi48Z5Us5HBfnF7yuzr4ye
         oIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786207184; x=1786811984;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZT51qHrYgQnWWXcqf3U4YiUd+vws/gvgF5A+hfVeak=;
        b=BtqA6tJvTqcmD+gFfceXjf8aovywuFKcSfrPeS1ViWN9VH0g3kuhBKEjUreoqrtKk4
         zIQMHy1io0Ab0tSXEKxDWk1dpwW52fYQylBSO4IA5aytqDSZ+/1bQeU0YEkJ1S3GC92N
         +MayFIQEI6Xxao6KkcIoSYgMtXkwHRvNEYt82bzWGPZ7QAa9XK+1+6ySX/i00aoN4UxY
         BdzzJoqLZovolffQJ/nPGzelByc9My3fuc9SyzYhF6PusEfJ86mv/2SK6nLwPNeukDgt
         URHn7v8rKs5LNHtEZzjMlyXRIgRPYAWP5UHsjDFGNf1XFpvLVjgKxxxfkgF4/ze6eDY5
         id/w==
X-Forwarded-Encrypted: i=1; AHgh+RrkFH56XKQeSeevQZ50VQbItxvvrX1Zf8Y5XWB0NgN8gsDtOkh1T6+n/KPrXLWUc24ftbQK0bnzZcc+Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YygxGY9esfjRik06XdAzcAfT3wKsSswBLqEBrMXpAim19O5sgVH
	jQYHz3z1qGhTgC/OXoUKl2MUPfCsVWmkREG4EKSSZUuzX2PqLcx4la01
X-Gm-Gg: AR+sD13j8PMk79PMBRIttoOv/K1fGGY9Berwmt1tCA9bqKSg8/ZNfEJVM8wTtotkq0U
	WdYNIksaeY63Bf8GbUaarjkXfYRNcHmbco6M2L7v5o0dGphw4LMCDh6Q7C6wlPBz8awJRVdQhGm
	5I8vlePVlCTaA05UBFkTFgeoZFF5amR6KNxP2DUpDyy8yxg761/htbDJ+RCAuOOrx9WMMFyewC8
	wTAx/lK2o+N3P2wdhxorRUmrV5CjRfkt09Q6008y9+XJGsH0FyIzowSlI3zaDKj462Pqlo1RLWP
	izhntutsjjV6ABBmEJUvJ7bmgug3PHEhg49Q9Jqy7O8DTONpg8xt+NLARRLoEFasrsp5ltt/rKj
	fByZrs91jkbhvgKiBgcBjMFfZj1232Kf3GwsckT1FY59x8Ht+8J40kSKqrVDcBK/IW/OSVeKzbo
	elWdSGZEiytF7kLG9By7RNoEnoWJcAlxK9N13w2Q==
X-Received: by 2002:a17:907:a41:b0:c20:31d1:a89f with SMTP id a640c23a62f3a-c2039cb1675mr1455668366b.24.1786207183880;
        Sat, 08 Aug 2026 09:39:43 -0700 (PDT)
Received: from localhost ([2a00:7c80:0:3c2::13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080c90eccsm183588966b.40.2026.08.08.09.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 09:39:42 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: hverkuil+cisco@kernel.org
Cc: andrem.33333@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [PATCH] media: av7110: refactor deeply nested PTS loops
Date: Sat,  8 Aug 2026 13:39:36 -0300
Message-ID: <20260808163937.17504-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4a9b9842-8d51-4ddc-9b24-b69440091345@kernel.org>
References: <4a9b9842-8d51-4ddc-9b24-b69440091345@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks, Hans. I agree. I'll keep the code as-is.

Regards,
André
