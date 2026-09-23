Received: from mail-wr2-f29.google.com (mail-wr2-f29.google.com [74.125.225.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA93476CE7
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 09:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154056; cv=none; b=SylpZIfw0t3vm6Eze02qMAel3UxOhjfUcc8SGI89uVW0NWMrfKR5YK6LzUTtyoewrsRjwUmM5fJnJH1aDtzDDPquyLTrVgkPQEWogUuqGnOYmdK7JUz6SyG6hsADQXwoZgY8nyVYE+OQq649u1Ce7/P2WXT6Q3W7pFdPEuBffwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154056; c=relaxed/simple;
	bh=y+jlf8HC0jzi0HPwewqu9aTCsp5Qe3C5F4r8ZihI4BA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u77pTqDuJq3fy/bVbVOLTNdf7TxQPH7uo+qHktsntRb2jgQ362nL1o8aSUKnFR/irYgwa9PPlV8u2S2yKkJIXgNeZSahExmIuiu+iB0kxl7IdVAJjS1RTuPvgUUUYokEmGtlv6/Nbl8Fn4cUtwRZEXamtX3cfXinAFNOPkmVMyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmHTxM6N; arc=none smtp.client-ip=74.125.225.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmHTxM6N"
Received: by mail-wr2-f29.google.com with SMTP id ffacd0b85a97d-482e1b30c94so110852f8f.1
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 02:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790154044; x=1790758844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+jlf8HC0jzi0HPwewqu9aTCsp5Qe3C5F4r8ZihI4BA=;
        b=DmHTxM6NN5gNwGhjAByyJ5yPvK8n+kfdw3dXZ7BI0HB3GM3EIR/wFIBBcocOuOI+0U
         qbr5FhP5m81nua/tDx5zZC/nGtBV+JvEKnNA3ZN4Zj0uv5yIJswWqIPupJbwn+aE6x0x
         B5fxcYMCc7jzJN8BjhdI7Xiu9xUF6Zs7ZgSeovP3cTL1pNjkvIV2cnu4sYYGhdleaxQf
         GE0YCCrPxjCxxGN8l3Xhovj3+DyHKQ6uM3ppKbElYLFIA45cSEcru+YSGinnsVxSlk4f
         g2vMHdFF40yaa4C73DMm23Vfg/UmGnDe/LtsyZ6K8JPDoLoz9S0Kc9+0n3WEhjFuldUA
         nQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154044; x=1790758844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y+jlf8HC0jzi0HPwewqu9aTCsp5Qe3C5F4r8ZihI4BA=;
        b=GyO3QLmQ9Z9NULYM52P4MQZjm7s6yOCaDKc8DzP5MpRDw1ZsmKu3Mmu32FKiQataxd
         qbOse14vrJ7z3k35WFB4rywXhKqo7JqWvVAdTSnOOmj+vgy7HmGCpfkVtjHKXTaaWzsU
         OaUW0msft+pnD6GI0p5BcJZQCHVt8rxzLjb2Jir1hqdONENpcJaAnbWUAyKr/HB5OPfh
         BV2lFW/pNHVArym76TK/y6YhGgOSz7Lqi3J2dMTzOc52/5YBDxV5Qch/xrnIEO1JNRT2
         qMfdcsZRkx1Y45/dw2+HAm8dHq97CgCYlOXL+QAR3oHFU4ASEHADK7H0VjBsisEmUTTd
         GxgA==
X-Forwarded-Encrypted: i=1; AKwUvBxoV3FhDKpTUR10wVMEkZERAfkO9c/gtRsC/hBgeYWhPvTUJDFYuao2xVW0lf1bxO7yvS/iz85UcmGZZA==@vger.kernel.org
X-Gm-Message-State: AFuF++kuCijweIYpuEwXxrGgdCU0M2+sEPS+IqN3kiXmEmlpgH9sFSCO
	JVD8fqHT367zmIX95TndIGoe+6rj3nRjMGF/FV0Kfb7xt6dhcpX8xo5k
X-Gm-Gg: AYBFou2d8aNZ6kxeZmp/maGQlN4bsJTVxGk5/NzdQeAvvEZVn1j1Hxibsjm1ebK350p
	Qv65/SZygXphTrBiTM7RmqRNIi3McC6gYuXExEZ1afWSO2RhxMWWRO4oTvov0VR/krjaijBcx84
	Nac3+eoqmVy1j37CITCKRkYdhFUo6dxexVhZ+0j2M2bL5nIrZU/It+u51fYFzxUU9boclfb/4sd
	Qjt0UH3dB6CNsr7D6rHGtbG77MMOv8vBK/hFCZaQRL1NcFMiHIvaokKWs8v2f+6KUF98PkyDOqW
	a5lFBSFsIB02Q545TTgSzcRmQfOz0KAwt+5ufz7RdRnW5VEETAl+kdXg0ceKKAuvSY5ibI9oFJO
	qGVxG+GmEME19/kulHmZxlsSDKvlA1fpFOjfJJBnzct7iBhqDOhiu7xBSCT2qJ6yM8vIO0DGppm
	5rvnVizIu7k1ybQvIfqMlzIgAvmt50RL6yb0DfFG5DpdjeVIUP/VTOlwt/mTHMBKXYvdRv8iUlE
	3XUsLhHVGRo97Kij8h0GSeHHzUTkYSCATKKgCMWZyfvZGlxt87DSd0eVzhned8RkcR2QnzeObyI
	JzU=
X-Received: by 2002:a05:6000:4a17:b0:487:803:ba34 with SMTP id ffacd0b85a97d-488670c9e54mr2673656f8f.6.1790154044255;
        Wed, 23 Sep 2026 02:00:44 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8F4500D949869966507951.dsl.pool.telekom.hu. [2001:4c4e:1b8f:4500:d949:8699:6650:7951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688893a0sm5538990f8f.32.2026.09.23.02.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:00:43 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] media: synopsys: hdmirx: add HDMI audio capture support
Date: Wed, 23 Sep 2026 11:00:32 +0200
Message-ID: <20260923090033.16539-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721064115.64809-1-royalnet026@gmail.com>
References: <20260721064115.64809-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Heiko,

patches 1/4 (binding) and 2/4 (driver) of this series are queued in
the media tree (media-committers next, ee6a964dca65 and d667a3c4d003)
and are in linux-next. 3/4 and 4/4 both carry Reviewed-by from
Sebastian and Dmitry, and both still apply to your for-next (4/4 with
an offset).

Could you pick up 3/4 and 4/4, or would you rather wait for the
binding to reach mainline? I can resend them at that point if that is
easier.

An LLM assistant helped with these checks and with this mail.

Igor
