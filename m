Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411944;
	b=jIlbikby86zLLpnYAL8rNlEDmweBMqcfeDXsas69HFdRA4LxCsDJCod2FkSPcf+fPGDT
	 Jc30psBJENbmCeXsxpEA3DYJR8waONP25bFmeQdf0WgtucIgqNxRKUtueg/73N70CiMYE
	 E7ZtCYwrl2OOFYQ4JFX/6EpPBvbL5CFBmDFYkRlE5rV8cQ22yoY0gFsXIwcUYZXSirj95
	 3m8KDxurCP+U2MPswk4F4xOcsca2GMxmTbD35HbjKUDP5ctwUK+785zSWlHGT3aNtpKAB
	 kNQMS3S89Ra4hJWKgxznjqTPz/95XNsudIVagXcVs73d64knM2yZlMF4dO2xOAwbJ2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N7jG8qlIvYKjoXn3tNaYxmGrygzFqcyCAqa2HwUrUVk=;
	b=DUMuyMTLUAeUVh2xeiUjMlJErY+nJ2EWRZo8o3M5/66AIII2HabZesOiQmhPwafUjjRe
	 nKEbVqXArG8Xe3Jp4huqXHXscAbO88F/VEK2R8bNGIsqGOitdn0p9+3glCWEdhPMiqplu
	 ZxbipptWAV8jypGyKHmdEXkk5h2yzC7NvpjduGHnq9kw9xQ3QXBY4ycy/9DgPIGwpFTvW
	 rNNGlaRh+yGMrQQ4ZHRTYhvXE2sxpkmYI8X3I+wYYXqQCjGHBTvtH7D9owkv2jv+XT9HD
	 v4EV282sNrehP+JTBCjEvoMB/8vrW34UkvR/s0T2AC9WdeAqC++5GP0uSOrCSUc5lVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qJAZQ6mW;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3474C606A330
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 15:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3474C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qJAZQ6mW
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67be6030c9fso2921144d50.3
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 07:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794411943; x=1795016743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7jG8qlIvYKjoXn3tNaYxmGrygzFqcyCAqa2HwUrUVk=;
        b=qJAZQ6mWSMFxoquRvMNoXNgt5hiox5BzuH7nygG4x5JYQWfHdgztateXr9JCOrjHxv
         NnjCaLmomq2hI0EWo034lmajYWUKCLvVo+g6hs8SkWMMfaBpbIYsURUiwaCl36zBpRch
         qdeJWPwVzAtG7YnxbMdkX4ZCLoGoSPtf4aGoMCPCWAFZKhcMUKCvEVha8XMiBkK8JBYY
         Mp11glU31Sn78rdLPi20mOiHVrCb7K64DBlkVZFSHNpFH5m+VCxl3vhRQCBJUCd0O/ZZ
         2x7y51B+T/EXNAqWptrxq19EXJ94T7VNcmdMUhhT66V/cHZa2q2sZNOJlT/qYZ90M5gn
         xFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411943; x=1795016743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N7jG8qlIvYKjoXn3tNaYxmGrygzFqcyCAqa2HwUrUVk=;
        b=n1GFyH1GNw/pZYsAGLl2pGoa+mbGobPgETwW/QHyUo95vrEnf0UjwLxKUNfxAFvq8P
         0Ud7Ny8tFfQyFaXJnngNzAAgXEtJ7Cv4YMuCD5gtjkBIyAuyRhYz1UH+c5wqkOlUmucW
         9LY/UyaczdLQYpmQV69WIRWtJc9ofcKz1EFr9QxrmJJZpk470oVCuBoZauyTsBTaC8vx
         b9asM7MMaIUHqUi9JzyeBIM1Zqza5OXwJmpzTZ4bnsok6URlOK302flFAnDTOnWUwrfK
         Gt5kniuDB34UZSuOZ4afWFMqjoEFjnMSM/GUL7jglLfTgf/TPU9LwzUWW04Uhb31o03L
         Rf+A==
X-Forwarded-Encrypted: i=1; AL+hErGQSXGpqYj5+IwiQPeQsTVVKYd+3Lm2jZEqXQhcFkYYXiBn4Igp6zzQoKNaXKQ/CMm7cEI+p8k6WQmxCw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+dz7pc3JCdO5dJAP9D7cjuMXuoNRV6qjrNGWhq7/5iZwHck0xI
	y2rvwgrlWWzN0BRsYuB6pUwIj4IWVA82hZ6WqIrlkGae9VdmzREmb4toOaPG5poyWuM=
X-Gm-Gg: AYBFou2+nqSJo0xed61mx8bhtsDDWz3GnHnlJZo73uC403yj+P0L8L+pn58PtQGe7WX
	4OlEHmUGaXDxmqmSuZ7/y2LBCml86UHT8WUcAiCAvYXpDVhk6J5DWbqgfhRWw/4mi1a1mAbAt8h
	D/WodqbhQ5JgPM70/mWenDcAevUG0Znwm4uS4+NER4y4IQ1dRL0EJ1Il9vVlHdv2+CbtNfzAa+w
	2GMvQKmFO2GfzJCAmg34TTNAJeVAGWvFFT7cjjXpScWq8BmYW22U1ndFcuVzhdvf9s7IGkSUinJ
	FiRk4mGsHQsQZFnULwOAphypvQnnevt6hJ1Pd0fekj2+4K8gGUFMaNBt6pDoFZoTtETKA86UIHW
	O905c44lvZR9gGjrOj1hcqwmJYWMjvIXzWslTjziQOU9GK7yR397ThdD3vuAK7lZvEuTu7Jry+q
	MfeRD7p8wSeu8v7AJ7X8rUNThTFMBk/vvckdP50YgcZ08pZaJ5G2apu2cjID9jmKWtJ6KFzgeuc
	ia1kcqUK22P6CM9/k5dQdw/MKHQtDjBnARfRNtv5xTX3Ygpz/v/EOPR9Szp1VwIE9NY1yhToO8K
	QBCyjN6B+5tnAjUQveR+ThNx5BzSIdZrVV3f8Raeo+pzmBDe9L4VMGMumDH71yrgWaSe/dkON5t
	7w84=
X-Received: by 2002:a05:690e:790:b0:67b:f621:8d4c with SMTP id 956f58d0204a3-67c67f038dcmr1488696d50.25.1794411942980;
        Wed, 11 Nov 2026 07:45:42 -0800 (PST)
Received: from localhost.localdomain ([104.28.212.24])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c6e207adcsm1433127d50.15.2026.11.11.07.45.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 07:45:42 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: qcom: camss: vfe-4-1: program the RDI write master buffer size
Date: Wed, 11 Nov 2026 12:45:36 -0300
Message-Id: <20261111154536.24163-1-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <6fdd46b6-e57e-4688-8231-b31b61810cb4@linaro.org>
References: <20261111135338.27008-1-allan@fatecpompeia.edu.br> <20261111135338.27008-3-allan@fatecpompeia.edu.br> <6fdd46b6-e57e-4688-8231-b31b61810cb4@linaro.org>
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

On 11/11/2026 14:35, Bryan O'Donoghue wrote:
> I would appreciate a more direct and succinct problem description.

How about:

  media: qcom: camss: vfe-4-1: program RDI write buffer size

  MSM8226 has no CAMSS IOMMU. Program WR_BUFFER_CFG from the active
  format and clear WR_IMAGE_SIZE to prevent RDI buffer overruns.

Can you take it with this changelog when applying, or do you want a v4?
