Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3BC339389
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 23:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791847852; cv=none; b=KCFi5jtLwSZWWdrwEw/ZmwLg4Qv8CJ/3k8XWOWsF3Gk43DAY5RUh/zvpWDlir5a8rZQKiVGtB/egZeiCN1neH5amjOFX8kC5HvnFy73jvidLc4CBJSeBYditi2egcL/f68W6aRszQBUeE/bKrrdj/kiyAIdehtAdESySPhsArow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791847852; c=relaxed/simple;
	bh=CfunYNfp8YoHmHdRkHWuL0TCzYiZC7UIKmuNtNZSoPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbUWLhBqR05ix1oqINaDoquMtiWrovjVfau3RakfYwl4xdSJ4uQNUCaz0f47lw7RUY+4X50OMC2WrOtgyVeUecYSxkp7mRsyGZfzSfi+c/FBo+nHHivSTLy5f+lb2LYGISfc/mMSWPNUZv4gpESUfd6Z2ZIrzS9lvyN6v59NLH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=ulIy9y8o; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="ulIy9y8o"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-9178aabd30dso24943116d6.1
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 16:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791847850; x=1792452650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CfunYNfp8YoHmHdRkHWuL0TCzYiZC7UIKmuNtNZSoPw=;
        b=ulIy9y8o4O2E94fwzxN7U9uxpuwYDq7AhA1xg6LvzuQY3SBl/y7kQRRst3bI1oZXPk
         u4mHEfl7mjwQlcXRS0Iklp7AHkrkVSHYrYiq+qOfUZkFg7scSiGz7X7CmHAY+9RF0TVA
         R4lFbTHQ51iVXVNhUda08YHingt6vy7kZlwApBxAGvDCQiQ3ZcQ5VnE8uEdE5xXJFkb9
         n+rROulP13L3dLWk5Knv18e0mE8I/gd/gDEU7Fg/n7oh0bZOrSZfUxgz1WU2BeY1nQxp
         JrFW8v8CCQorMM89/K0t6LPTe2qxitk0ZcHfGu6IcAx/ZFJ6i4nJ3Fn/o69zfeQ76yTT
         ma6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791847850; x=1792452650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CfunYNfp8YoHmHdRkHWuL0TCzYiZC7UIKmuNtNZSoPw=;
        b=HUTriCpbdquH1+0f3MPrZygwhMQ6bH6ddg2JQKN1nYmMuuv1w+1469D+2vqpN3UWlX
         w5cgr5W4CDpecDSxSOE1MWCRYKh3Ms74F7gSa20NTqOBkvgEY7+EZUSRFDsSCgLdol0o
         /couq7gHVcdU+u1MfKtAcmeuaBxRImCI5vSL5+SjXR+1lZI9IwDefwJEeRJBztbL/KGW
         wSxfXhH567lABB/V7gVFI8aXt6762hGZx9lrtOxp+aX2E454xCO+oCKvSa9jKeD4IvWX
         UXielNyoCpt74iZFa3u1lG7GbebciwrXCmvjeeoZFtBqijZHgF76sKZqCUo5HBSovpOc
         Dzrg==
X-Forwarded-Encrypted: i=1; AKwUvBwHgAkBE2YL0xjm3fBDYlOG6tS3ajwBzQkqJGe2AbQQZwBKChVfYP3gXs3Fauim3k9uK4/kyZpG2Tw8TA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3ET7UxB/suQD/qdeJqiDzLtpUIz8Ptd2ls7M3M0Eu4oBLtTGO
	vz1crI9DFGFuiQLyq7baqRVaepqJr5verBeP7Gevy5v7gcZc9NOe9a8la0hZCj5FJ1w=
X-Gm-Gg: AYBFou29MPu/OBXcET1nxn7FC+vQ9fLkPAth0Uaw6NQw2cVdsoRWpLs6QDFY+rIVVX5
	T38JdCJRF97viyx+FzTNIYSx0t//j+2tZaFv13DZkm6+417ZFDit4BlCbrYWpvMh1+ASZ+CmJo1
	OQmCOwxaoO2AJuaOAPEQPuSqJt/nrgJWh0FhK98vmvD3NnpRXhEi5hT+iCyRMMqEgMNx04H3tao
	3L34TdXzkLeVBorZIEsZhtx1+BxsrpJ76Wd6/6RDgViOq0tEtu75RATz1hg0qud1JJiMDyMw1py
	UeqVHY5sF+5IjeZhQa6vhm7BqHN+RnYk7oH11RnKNUVVlbzKT7gJlmzXMwxFajFi+Bg9bZKvS3s
	RJewZLNcLk45z+AZWDvcfomOzhd3SguM/+ogkWBYL1DizMkBfzPAXtgJY21XdPeIIGvvfDIwzN8
	LbXIAxUbPNyRLTC8LURcToWCYWmPm7bLc8Nige4FqPg7TkvynzvGTkdX56U+tE94I1hVApoA4NC
	aaBkeBvM76ayxkuONVrIQyNqbHbqy4BcGAJDwB8WanIy902i5efIAtvCpQDkKjWGUzgAuO1tCmO
	PazOimVMq5QMFeKMH7Dd90G+AGln5aAK6tgmKWxna2vD2moQLV+4rg==
X-Received: by 2002:a05:6214:328d:b0:91b:5d3b:4abd with SMTP id 6a1803df08f44-91b5d3b4da4mr183530656d6.50.1791847850247;
        Mon, 12 Oct 2026 16:30:50 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::662b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b3864dsm10654626d6.14.2026.10.12.16.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:30:48 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ramshouriesh R <rshouriesh@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Eduard Kulyk <kulikeduard89@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: staging/ipu7: Add 10-bit greyscale capture formats
Date: Mon, 12 Oct 2026 19:30:47 -0400
Message-ID: <20261012233047.1026925-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <as1QTFB1CRDNxAEY@kekkonen.localdomain>
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com> <cover.1791608336.git.j@metarealtyinc.ca> <5423f57000600f27626ff785f80f94d3e7ad1106.1791608336.git.j@metarealtyinc.ca> <as1QTFB1CRDNxAEY@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Mon, Oct 12, 2026, Sakari Ailus wrote:
> We're about to remove the ipu7 staging driver, therefore I'm not taking
> non-fix patches to it. Can you se the ipu6 driver instead?

Understood, I will drop this patch. The ipu6 driver already has Y10 and
Y10P, so nothing is needed there. I will retest the sensor patch on
Panther Lake with the ipu6 driver from media/next and send v2 with the
result.

Jake
