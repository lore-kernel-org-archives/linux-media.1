Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586726;
	b=q3PSGCcZgZsosUDu9wyY0rHzd1RVTlvEQMMxapVEP3XylY375+0CYjYc+OtvTl1D325c
	 aRXxf+jWCbpItbE+LasVhYjv/Kv8LPJj56ruzgV80YNkmyidLUKrMsQiA7ILCoYkFEonb
	 WiOJfVirdCnYKEjjXylsXJKS/436h5sSlu+1nDizXBF2v0aoWto5XqbW4seCrGx3muMzR
	 8B2tFewCGAProtcTddorWSZS7Ig7F9CfSo3V58Ah6P6B3aTox3TgRYhv6TpROWq3VYugi
	 XQTim/1nfuijFSNWEHJtBigX8rCXFR2yKG/6/re2K5Ybu/XKHSHRde0qOhtUFxc9Akg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Y+KHlKsszZZuhdaqagwVxvQeZSNU/AaISBE1dxzUs48=;
	b=iAFXnDtbOg/F3hEzBH0uEuyW6vXi9N/0TnaFaAEG4mAqDSvv2OvpGD8fBfcuAIf/0rOl
	 hpLdyd6BCGT3Lg2eXZCYN60IQSGgmaRoMPE7s/XliWBkTNoFyS4lpUDgSshodNgcclAQw
	 VU4kLqjByZd2ZFyVvuGPRKNquRUuIjGRDfv1wfWpvmOXl03G8bXArr55KDMr+lOKFQbFs
	 6y5J+X64HhDR7HhGb8bgFyKruKG6v9xOUt+bZvOzWbYwM6lsipOTTJp/u5cgXLTCBzH78
	 DC4X4Th0tDSqGl+PtXw430Fi/hT3DFWAah4rH7r/F9r73nED+Yx+YeWiwev832iOYGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0BSaAfq;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A384606BA94
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 16:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A384606BA94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0BSaAfq
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c247f6687dcso289665566b.2
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586724; x=1795191524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y+KHlKsszZZuhdaqagwVxvQeZSNU/AaISBE1dxzUs48=;
        b=f0BSaAfqvrF4YVCe0zL6bqwE2NH0qNrRF4mgMNPzpCdomHb+euxkiM3S0I0BfoUMez
         rwiZ1SGxAy/qCs+Qb9DQwE8VMfXB1mVZinJCFkVmh8sjIGvfhhSNfbVbBUmOPN3IOgG0
         gqLtcTpMO8r5s8soO531ZL8MPdnbMtoKWwOX54DEokKWNJdq2Ytd+9L8VFbZHcUaTprJ
         9G2ZkREvaNNmkZOT6WPseTtFfhq3ezBzAEDrqm2wkPDTPAk3PFHaVxywpKECjmsMvfVe
         tIz1s6d5QoCurGlPvAymyvpSfYcTt/V+tKWJDJELoSVQG3onfx+pSg2fF8UlPDXwWH/m
         +NbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586724; x=1795191524;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+KHlKsszZZuhdaqagwVxvQeZSNU/AaISBE1dxzUs48=;
        b=zBSslC7gZy7uVZg3M7OcXMRYQUaR34OKFJXg821+SB3K0htHDgktEb+jALLfVuW6c0
         sMzvrmkXSvQmJqKlw9xh+gi2ylewSgk6nHK9e7sG0iUvWOUDUHTvZDt1VuKFlU3EfN9o
         vPQB7cUzu/VJRpUtGRTs3z9taWgjprsIjr+18c+n/OY1Ir1DnTMd0keS0rDr0obg5Ad+
         iESOomOOlrhQbT4aqJUyLDr4YQWc6UaXLFvz2uyApI+lHOtBmQWcinNic7Uj8VLmV8HV
         WHQjqK0nlYWj/tPQepNu036WVLCJ4DYdD1eZQpP3sMQROU/hnHcooSICrsGb1YZYxcN/
         6hjg==
X-Gm-Message-State: APuU4Z85fAovjpjs/Of7fulSdMVDL55las006uRLafAJp7+W0CDUg2Z6
	L/Tc69QohYsvJ+9l6FluLS6j7PYvHaJuXW+1I20J6aYddnna6Sjdl7Yw
X-Gm-Gg: AYBFou3oyFZ/Rbtj9pkGgMQmhXhH46+TMcKOV4g7sXsIHoHNtg1X5wkNMU/uymk/o0B
	uFbVP1cNu0wp5J53vKYBvQA/VrrBSgmKP5X0XYhjTiD2RbEXA4wPoNv0SgKBi8oqVWPNwlTPFeC
	ZqXGxzsZjShdSxAJ8f6LXqTkOZQvGhPUPzeU7EAsAO1mzAOZN1bs1z2Zjx4pWsac65ZOCVO5KMr
	5ySqqpQ3ni7Srb0Pe1B0vhf/3DV6DV2Y5xk4kECxVwhuJtWFbDmsV7pvwy1K409MKfR41raDliF
	fYQTOIDLJrZMwGJUAeElN8jGbOfkOu3Lj42izQmvJblIauj1hCmW4WTx49BuPie/a1xwtLZI5Uc
	79SSu/3qtw44awvNcYEP8PsnqTE3EhJXMHnoB6/a1wLgU3vlD98sQ7lHt1M6CH61h419u9vB74q
	W+4OTNVCjbtYCphmzb0GW2Hh0keh5JUKkOFjQkJLEDEo+mFDuJejsoWsV6uWDZ2jUaXug8vk2o+
	H/o1pAASHtH5pS0ZLnQo197sGEJyZ3GzBWs3eayxzAE4G6U4lfEoVSa9MHhu08FvxIgUktey+VL
	G2EMn7zoe/STeFfTDXKX9/o2JVNtmVMelYx1yABFggvbjik1wmxqyKD1Nqv2JYeyHai8Yr1bi9K
	qX+wAg4t/jkE=
X-Received: by 2002:a17:907:3f20:b0:c46:c3ad:e1ca with SMTP id a640c23a62f3a-c5096396effmr277084266b.9.1794586724367;
        Fri, 13 Nov 2026 08:18:44 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:43 -0800 (PST)
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
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 02/10] dt-bindings: display: tegra: Remove Tegra30 fallback
Date: Fri, 13 Nov 2026 18:18:11 +0200
Message-ID: <20261113161819.36847-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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
different programming model than Tegra20, the maximum VI clock differs by
nearly a factor of two. Additionally, Tegra30 does not require the
APB_MISC workaround.

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

