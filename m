Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605992;
	b=hJVuPARNnD0V+urOf0F2C2qgZB0VaV7wpwnp0AJyQuCYmulfdQvqM3wZWzKANleyDj7D
	 vlLG7qoLinpvHaXqFQh9EXgk7HDhFoK1e9qzdDM02LEli4kWkDsd7QYx4KZtX6W80DRtM
	 54Z/q1Xv7zb63xepvbBzM9oNAAkrW+oX2jjZqR/mEvKqWd83CFJMUkW+JY/QLMDiqs+SU
	 YYYLumNJKqGqNHgflrCvOyKzA/KxXSiR3mnQ8j2aqBiAadG2eYrZygkW33jtEScMufagf
	 3aImKd3k7whxOZj39ooho2GLikMyEt7idNvz6VzmLZEKyHZe5jupX932NfXblob3aKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=g6WheGrEKozXa+Lv+Pc9T/hQQN8VmqyBg/NVOB1TtcE=;
	b=3NxuEf4DKCzFMeq5H3JF4NHSkhGWcnV8mxFBcDz8+LeSSAIykZPQAu8ZrTzJSf//DmqD
	 aisupL2gyv1+fI+p0fiZoCbSd57E5V531bkcXqSAVzfK6fAVjxstCyaIrHedro1ibKSph
	 WGVbWbjjGu9xgxE7JKsMyZJl3LWZqr1+0z4ykGpqz75hKuO8U0uBLsnVE0uY2nBC49eUM
	 +xJKzfF7QWjSFdhabwEu+z740PceI4M/MnL93yle2hs3L5K3ss0ZJSN4rEnRpo2cbtS1n
	 d9gFQjjXnRuLMBa7SEM3KSm+NaVGv91uozmlI3TvubRh2TE7nFHRbto0IbQcNs57ybQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="s0dS/JiL";
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F3F606A69F
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10F3F606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s0dS/JiL
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so6561670a12.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605990; x=1796210790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g6WheGrEKozXa+Lv+Pc9T/hQQN8VmqyBg/NVOB1TtcE=;
        b=s0dS/JiLcvpL97aX6ifBN8UMRnPbAYEY60AlqHPB3f3nGYubja252dFE6hKi9nwYdo
         DaZyGwWKZ9wv9TZX0gDQ6BYOoZibctWuin7ZpiE10NcI1AxITIxW9zCTqb0JOyH8dihW
         iChCva1BH14OmMB59y+XqSPPXbN+iRzP9Lr7h2MRJGz7QOW3tqMrhHsbrKfVm8OMdBr3
         gNfY8L07HP+wI5KSbLHthbJaDFKnJUFtSebD8Yx4zOMTmv81ooki8nwS/k5VAbsrBhMB
         xDD7PHWC7G761goRY1lOMcc+u3ggeTvCQbR0GmsGahh0MPI8AAM97eZ5O2f51AY0G8e/
         7RHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605990; x=1796210790;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6WheGrEKozXa+Lv+Pc9T/hQQN8VmqyBg/NVOB1TtcE=;
        b=w5nuK4kl2uP8cL9DNo9c38z/zBtcWZzGQMqXPi6iomvX8qPIXN0O02NPKUvQSeq1Lv
         KpDLMK4F4V+3imkafudVjqlC2Er5v6CZSJMtRuMjKkRYsJ3teeWHFDEtnXyFtziWewX8
         wBgrbKKcrRryXKL6vy7CKpzz7lbBptrRUGkogebClHWpxdPYP8xEgkoECcZPBMpj1nJi
         7FDhyKOjtQk2R653EsbL33c3oEeaavwRlka9KMkXOG/JKyCIvis1w3Q7sCvPBelD5cAn
         cJWLtpPzlcPuZV7cmRcm95M0Q2DzmsVU8t/ocmxNq7Z7p78PhLu19mohK4z4j/6Fjqfu
         br8A==
X-Gm-Message-State: APuU4Z/8IdSAYKxWcctKgXo9wKSIeiDwggv3bP1pOeZtWrLVmM08lduO
	nxJ8YLp/8JsYGVNWnJJ/vAsF8gdKo23J8SMqHjiv5UDBmqSin6FFmD6s
X-Gm-Gg: AZFdTZc+kiq5UcCtpiNus1YXlhggCijKP8YCwNFNY2r7rHAnbbT5F7RJiffxc/DguFY
	cXHPNwRN9dWq9X4IAY2+23y1yBI0vZLq3DkeP7rB/YkzHHzG/6sLMVysGzovDXJNfMpAOYwZS5R
	wWS9X1ls4A841qLXqyVFQqNXcS1gbBenFi6u0K/VqYOXwIJuoqcrq7QKAOirGnECJAbBLQL+1+3
	1yA9LC7qsP6m+mW+mnTOkTltOt1Of0xnMpNpayBOiQ7Sx8s2V4/U2qD/vXLMgkahhNIrWi0RZEb
	7q2eOd5rb0atrID3OA7+1QkVJeeGVgzxhPh6AB+DrqIV0mkLpHUlNGcxFz/YOeQYndO750DdHBY
	+JEmrgS7v/ECZAV5t/bW+g/V5QjYz+JdG/MFNwK7ZSfK8Z6F9Ayk0YBBV3P6NRfIUjCdbGWzPet
	nqbpVnyhNRi3vgmRHALScTORpbam9HdVJEuqGSTJD1siOE/rQmD1O9esqvhd5gpy72mMEOvuZvn
	p2RaofPc0O+DMykvh7z+kLgwKIrhM1zOKiQcTJlYdIkKL+PMQMTWnhPZrEc4ZRxgTfMr0dSsGPR
	ugKNvQgjK8/B6T5q8EPtXci87egcOzWHL6s6cWedcrLZRJWuQINSTT+4PwXL4UbJFX++/ZyYvME
	8c6BuHFv3sw==
X-Received: by 2002:a05:6402:4028:b0:6bb:2a86:1a58 with SMTP id 4fb4d7f45d1cf-6bb2a86201emr1407592a12.43.1795605990172;
        Wed, 25 Nov 2026 03:26:30 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:28 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 1/7] dt-bindings: display: tegra: Remove Tegra30 fallback
Date: Wed, 25 Nov 2026 13:26:07 +0200
Message-ID: <20261125112613.237333-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After further investigation, I have found that Tegra30 requires a slightly
different programming model than Tegra20—principally, the maximum VI clock
differs by nearly a factor of two. Additionally, Tegra30 does not require
the APB_MISC workaround.

Therefore, remove the fallback compatible and add a dedicated compatible
for Tegra30 VI.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index bb138277d5e8c..2d5538a1804f9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -18,16 +18,13 @@ properties:
     oneOf:
       - enum:
           - nvidia,tegra20-vi
+          - nvidia,tegra30-vi
           - nvidia,tegra114-vi
           - nvidia,tegra124-vi
           - nvidia,tegra210-vi
           - nvidia,tegra186-vi
           - nvidia,tegra194-vi
 
-      - items:
-          - const: nvidia,tegra30-vi
-          - const: nvidia,tegra20-vi
-
       - items:
           - const: nvidia,tegra132-vi
           - const: nvidia,tegra124-vi
-- 
2.53.0

