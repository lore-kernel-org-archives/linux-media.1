Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA397501F48
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 16:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166941; cv=none; b=tJhGfv8NulyYmunnqDus2m5JKnlQ+2NjLvqDLM2pCSE6udNSU4uXqaKnvNv/kFsrSJsFLoN4WfFvkfU7vw6ZJQn1I2RwYWOTfuzdeC1D3zrbyvFVjYQRDtZNLya850YsCTUzDUqGW5kI7Zqey5Xq0cV3LWWtAeMGg6W5q9FSOaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166941; c=relaxed/simple;
	bh=BX8jpYEOlAnaKcl8q9t92/d9RE4Fbo+mDDNxrXC25F8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKdyst5p3Sv9Th1HArh9KsD148YnNjp5x+3VhN6NqowjC90+0Rowbsv8jHwdJb0kKVNsDThmUTjoicFYvD4ij0OCiSb1lXPIF1pGJhBI3a5DZ+udjA6sqU7h2iY5pPSYtvOWyBX1vl6oiW2lMhwYef3TbLdwdlMNUphK647dtoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V01rT750; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V01rT750"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d05d51553so890705e9.2
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 09:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166938; x=1792771738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BX8jpYEOlAnaKcl8q9t92/d9RE4Fbo+mDDNxrXC25F8=;
        b=V01rT750maeN/OBqsYYim3ffP41BONdL4nuWkChBF8PkUVB4cTbKrk32IctOteMJsy
         PlsPMgZBMHG3NgHAjp02KlpWCB9DHfXPSNZAENzwezSjGAhLHrUjUOW2LB0NP/96h2Y+
         FXHmuvVM6IzOapmUkyDXbAUDQHvekv4f11uU116vfer1pkJHU6fFb066YdyT8l60xIZ6
         tccRreHP9AgpMHtMzzz3qpchYdpf6xS/l+SIfLMsg60cbGxKLZo14NdAeB40x4kbXLhS
         q4AHBajCwVYwbxEHHQbNs7fd639z1bgESEWex7hP34A1Otae4Kdo4lTTvyHLUve6qsEr
         cAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166938; x=1792771738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BX8jpYEOlAnaKcl8q9t92/d9RE4Fbo+mDDNxrXC25F8=;
        b=h3Ls0iEjvUCXmvjoKYFqPLw0f2i3y0WiGkoXPZusQAKly83Ml21NE5cfnCmUvOYLBF
         8vMq5Z7LAUW0J13lxOb5Ixy10wuOTv1EugDSScRYIwPwH2e0Ae0q87lZfMToZI4Ge53H
         P2eFLeTOPOY6AeUqbCku1HGk+fjoYLx5+EfJGHbcOhGz/gTh5rkJvtWokTnErNKAOHeR
         Qbag32f2zOVD0kgO7eOZD5UdahSVHGhEe05jMiAZzoxwZpOrcyc0+gyiEyg13c37p34r
         HFCl+orDFAl/j8pGssiar+n0jJ2+MH3Cyqtctkrra9k8dtpbFrBSbUmw9YXBd26J3Hdq
         d9zQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNGq6awSndCps73mnsZA181VaCBUrBax9Kfedqt9KidQfiItjMUZbIYGsh+PdHTGgaaHfzP8xXDgJLhA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI0AfDyMd2QQXIa6pSqwHvLJAxhxAIaBgosz72gQac0AcSS4ruJ
	vJJCNj+aCnd/XNZxcg3MS9ycC6K/VpXRSqNK7JnMS31fLNaZ6QlbuHWj
X-Gm-Gg: AYBFou0qlnKEPGRTBW9+ke30ThhWUgWsaaDZc2oGn0DirILnabkNzQe/7uC+5Tdx/wi
	pJIuAtxuFIR/dW0zHqfeQj3bYeVKZuCe87sSRz3Uxt7/Lna4GG0V037Opzxzm7CEGFznys5ItJT
	h38/nA4lqRlYnWr65XDJgEp49wOTduAnoMqK0+VyzghMrbFPSouSoAi8IHdC2I7xFJIsGUl5dyK
	lgVBsBs1Jsdk6Cbq/wSW5G5qwRRsi8NWs4FvNwjsf4FT1LQrSYDYLQ4BtH8Ggzw4wSiv2oYUeQu
	SmL4f+U8jWMAfmXyib+QRGoTdDk94zOtcfUeMGE7JUAEr07RoVbNo2LLXsfa5Ecl0ArGnahBQJA
	DHEW6vxOaCxLw4FLBuPhJCtfG+/luyiFFsrSj7OtO3N7mU6yPvEp/5Vyer+3TW20+n/lr3It5N5
	72z+ALJzGm6reukgtxsSC9p9Fac8G47mTfubWiSGmffAmVU6/fOxj5s+u+DlHGzoh2yg8rXrFKo
	nixDuHbWdKEzOPVeyP1Pf9zMUhQPMHJlkI3tRbosSIIJzqSDeyOJDVnF/upnrxrB//UCTCppA==
X-Received: by 2002:a05:600c:e555:20b0:4a1:77db:45d9 with SMTP id 5b1f17b1804b1-4a1d75fe6d8mr4483895e9.6.1792166937933;
        Fri, 16 Oct 2026 09:08:57 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8d1esm6219143f8f.39.2026.10.16.09.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:08:57 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Sergey Lebedev <lsa.uz@pm.me>,
	Andre Gilerson <andre.gilerson@gmail.com>,
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
Subject: Re: [PATCH RFC 1/2] dt-bindings: media: sony,imx681: Allow a C-PHY bus
Date: Fri, 16 Oct 2026 17:08:55 +0100
Message-ID: <20261016160855.193463-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e5d75c47-2051-4b09-9d33-d2eb64a141f5@kernel.org>
References: <20261015-imx681-x1e-v1-0-fd22f5f3b0c5@gmail.com> <20261015-imx681-x1e-v1-1-fd22f5f3b0c5@gmail.com> <e5d75c47-2051-4b09-9d33-d2eb64a141f5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bryan,

On 16/10/2026 16:59, Bryan O'Donoghue wrote:
> I think you should constrain the existing minItems for DPHY mode and
> then add CPHY on top of it.
>
> Your commit log says Add CPHY mode but then it goes on to do other
> things like this.
>
> Break the two things up into different patches.

Will do. The next version will have one patch that constrains the
existing D-PHY data-lanes, and a second that adds bus-type C-PHY with
one trio on top of it. As agreed with Sergey, it will follow once v8 is
merged.

Thanks,
George
