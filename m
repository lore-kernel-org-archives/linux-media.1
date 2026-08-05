Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23482473C90
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 15:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785944466; cv=none; b=HMG5jcW2YVjPEbxCSJkHpRl+ejic6TPWk4WcYDvu1PNawOg+RdD28+CSd5qBDwPAECBuYDbnrREYV9RSITsgx14mQXqZs97UgNKPo78wtoznGiOm80lAsvShoS721iO6Dn9lGhzDRHThKRg0b+AimHvvfSQLdvM21xuC0tUMIF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785944466; c=relaxed/simple;
	bh=YGyZnOMySi65/bdZ5huX6xTxZFcHOTvx87ZG/dFENaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZEKl13KBSJM9yRMkH5bfYJeHqZnUmNPvxirmojrMW1lheVD3T4cLSwKBfbuymsENiK4asdxwM3+rUZ+m5Sa/l46F1YXwnA+UCSCG0oiDon36WGV/bVua6cclyfczStBW5ZDolqRKWMsBQe2LiolHL6AtA8Xolq7G0ijRIyNI57U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTwKm713; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTwKm713"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47debaa89cfso57865f8f.3
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 08:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785944455; x=1786549255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YGyZnOMySi65/bdZ5huX6xTxZFcHOTvx87ZG/dFENaQ=;
        b=HTwKm713XXJR2A0Wl5rnLTax89/donTaZFwoDtXljie1JLc5Z68EFRxOHxvqhxpsRo
         mYkIt0LAwBzapdgUpcRCafkvJEdEl7Qxd71QvLZZjzSq18e0qCpXfMmL4s2O2qQsIXBF
         gHIEqNcBLJZsWUqtI4Zd1oCtPpmXWudyVJxNjsQ8zcshI8HNNUpdWGjvbY/tr6IP5MWa
         i494xCRnLfVC4c8EUyBtNEkhj90eB9yzmB+2tf0WZcMuLBq2ke4G1f9O5TWXFKOTtXn9
         xM5koJbezy75H2tq6EEZDRFZSFMz4N8y3O16wy72XcUL9RqN/+/6G4qF0QjkbKbsk9LC
         PKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785944455; x=1786549255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YGyZnOMySi65/bdZ5huX6xTxZFcHOTvx87ZG/dFENaQ=;
        b=c3riRxDdQ+61blDB4T06KL1WHrlrRcjqBA7ua5Tz36/xchfVop+OimCpYWMO5++I0U
         vNMnHStMowfbBvBisxD3EedIA5EL5NUB931UXV82f/v+tXzzfGi1hBsqHz3FHJNIpcjU
         IZQYOj+IgW1i48xpRIShrhsQZHCqPqQ38eYQhDWSM/8yv3Ew2IafgpYxU5QzuyAFCmMT
         1Hw2EyN5pdwhRejtb+LbpU+IB9TRWeFma/N3nVEc2tOkAqxSwffkDjDn3DyklevcI3xt
         CSa+Eby564fRmXpFSqI7Gwxf8fNxHRZBUaVfpRPc4oeoFQOmUL+eISnOsOZb51yxLoti
         QIYQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLLuoPgXXfaf1y+RhX4KkPEipfd6S4tNY0CNOUgSvPtWsVVoBNEglwTT3mqfGea0kivzh2XSMffKXrag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz25TSPqiaISOefXmKQWxU/a7z08B7LQIwGC7t569o1gWr+vj27
	GeK1oYBCQ0fUWf2CkWUKHxrIJAtltbOmqNDNYJA381f+DmOZN3TKqFvy5USrmUYG
X-Gm-Gg: AR+sD13SDhgadF9Q0ehBe5MIe9Ysf163jwP3f2agrJ2WbrBs95zU8uP84W3/WhWXiYf
	BybnWNPFRCoSfddmMcGB/ClI2Vj0eHND+XZ3h7D1GmjEHhI/RrM5RHRA1+rlF6IVvAXFUD7IS5Q
	ZSy1Ae72pMP8HIuyEtk/bquiVKHOxUfCHyUVKRey6yw6E9cJGoPMZN0I4obMVwHhppLRW9fK1n5
	x4JSxLk2nkiV1z4ovfsWhB6bR3sGLHjyCcCz7TkwePIU3tSUvmYF4QrE1QxXSpYWKQQzGGkVdDS
	ghK3gLweCi4wI9PcSMKhxXlBOkG+6XYDB9BKY0at4eVjDjM/M0zEQOyS+RL+MoOI1bEMPF2mE+b
	07exEW3oZqQ7GHdfsqlewdL/wttkAb6wSTe7oq1pdpBMQ+zV53/aNamGxkKorDlCukHbW7KGdKM
	+cwBC8zhAA0h1mV2AtR7OOvLoO4OMH2XQaqm8djoi/H5M6cv22/yW0wdd5AX0ZICFumpvap41aG
	2mPGQxCq21Q+pHIdkHsaxkGmGdS5SpOJu2YoOXgqN3Xk61yRM/E9TRKYSqhPQjk+K2g
X-Received: by 2002:a05:6000:1785:b0:47f:91f0:9ab with SMTP id ffacd0b85a97d-47fec484f36mr6647230f8f.0.1785944455399;
        Wed, 05 Aug 2026 08:40:55 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B86F10001BE789C6EE938EE.dsl.pool.telekom.hu. [2001:4c4e:1b86:f100:1be:789c:6ee9:38ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec23e250sm10866434f8f.26.2026.08.05.08.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:40:55 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] media: synopsys: hdmirx: add HDMI audio capture support
Date: Wed,  5 Aug 2026 17:40:33 +0200
Message-ID: <20260805154039.10161-1-royalnet026@gmail.com>
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

Hi Dmitry, Mauro,

First, belated thanks to Dmitry, Sebastian and Krzysztof for the reviews
and testing across this series - much appreciated.

A gentle ping: all four patches carry Reviewed-by tags (2/4 also has
Dmitry's Tested-by) and no changes have been requested since 23 July. Is
there anything needed from my side for the series to be picked up into
the media tree?

Thanks,
Igor
