Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A814FC352
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 12:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894745; cv=none; b=Z/75QZA4lkL2B/ri055Cfi5rd00DRS6A43jfff7apCnZlAO3x2Ktk2InB/vNjuU0Si4aCr+eI5DoXsAX3s6CGfHB4TzSb/mIryXsu0W7yJZ4nZ8v6kBOuDGSboi3zgL/7Dwtw8w5kwoJzYiuGR5+U48O7OXRVluJLrXlhAC2cvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894745; c=relaxed/simple;
	bh=r6ZK6uD24oa8sSVk1mSTsDl4T4OvwIA1Q5oy5fUtMgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cyU9OEsWkiNl+3EU04+Tj0+En6D+yd7mQ8WdbzR55vMOefPloe3lJISp2VePwH9Mg8gYcylAwYdG5ytCuxym7Vf0QCv8m+A2HX0+p0gF+nbWcoha0bQAzHEtSkTO4o70QxpSojhO485kmowcVLbK+/QWx1Ag1WdP6vTyzkCUus8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=WTLNRqKS; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="WTLNRqKS"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5339173489eso32056301cf.3
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 05:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791894743; x=1792499543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6ZK6uD24oa8sSVk1mSTsDl4T4OvwIA1Q5oy5fUtMgA=;
        b=WTLNRqKS5Bjk27sYdnguTWsrEVQN0XkLA7bWCvEWhhNworO81LhjACRwElyAvmP05z
         CkNdrWcQMs8EtCqsr2bYNb23sQrMfmvscEsWpRT33SseOvMzqkz0e3amx2qUQ9GLeW0b
         fov4AT5RxJk8a2/90qChtb/pQCVNZyfHKNe4W1DiMBfId1Aw9I93idZ0J7QdXyK0HT0w
         FQdJjW6oe2P/QzkKuWR0rEVah6hThY9KVuiHjJ8y3DXlA75L3BmSkq/1GFrpao+Rpi61
         bxbDhQ5BzpXB6wtmVzJwADyH0SfeLpOCFC+WybBjrgZPlEmjfVCFDVOJzGG/i+g3MIAR
         MoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894743; x=1792499543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r6ZK6uD24oa8sSVk1mSTsDl4T4OvwIA1Q5oy5fUtMgA=;
        b=sCa1QGT4fUwvTGGK1pMjRsrPA0KF6zYNySXIelm+FgO3zh/F5eroIPOYvQPAlkpNPO
         BJXnU4YdFdZ+hSFSQQVs6uHTodxjh5HArFLZmhsv4YeGKGO077JVHnMKIemXk7wRTPE0
         000N3rGenAiYSjw4esmTNzyyu/jKcAuSpbPC6vEC3LabdRSvrCY9UP810WhIxem1L3MW
         UTOA+WTGn2qO1c+p7ufJJCohcqgv1LM9gNUFsikWqvRb6pJ0jdkKbmCeHmA8ViV6xBAd
         7aZU9TmKF+m+kI1GX0K0cZTBUHgMRSwB7duA+h03R5uLg0mShD/308BufXj31+YxVqfX
         Lf4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwvWSQzd6mDB7Z57jgz1rzmzFufQFcvbunEuSfERSmPyBI+FGdRKH9qMIklcd5+7TccSDsmQTdy1R4exA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL7z3bQBK9sUT6ja76M+jZ1I2tUdfiGpH1B1/tGNMtz6h/O7Amt
	zVoBYpZ+3M8EKKGPgfKsv2zN3Rr6ZlI9UG6wp6U733C91Id5+KFEw2DbxNujFnA5BFLeOr9+Odd
	p7Pk32Mifba8p
X-Gm-Gg: AYBFou1VhGsVOMlgbTj2i8+j3trmRdgegKonHxp9jk55jMlaUgeMtTFHlDltZw74aoN
	y3TT3xMcROBYrAgCKZDJ3me7a/YnGHVFFImFvmESwOqJTZ5kIohn/+j6lN9bHJ1i2kwzqPMH0R3
	5z3XdGjkzG4o2SF+Z0SXrymcYvjPAZGQ8+TUx4zsBDPXDhwsYLNIaka2kuaKn+vXK2L6DX9pllj
	gx1i5mRnYExjMAATF6CpFcv8WBkeA6opiCz9Q3NmrvYacFvesjus3u9FPhKLSVevJnu6qzWDlIw
	xDABjCGJKIKdZzqsZFc8rLEc3r669lKRCQ9DuyxeM00fsvIoOga4tOUh2NImWCYujnme3IfbN8Y
	Mf4OdIcUfJ0HRklp59BGSxakshZhfEM6PsKpfvWIvJnAy5RLTj+i/KAe0TCSYQriDYRaEY2zBDq
	n8ajbL1S01WUYkp4pwYD6H30Lu6vzoJEC72sMy0UacbYGm/MALtGgj8nVVCw7R3RLd0olAM8Giy
	pzFcGYtRJTraO7uG1f2pFNu0FlatbTez02KUF2v2SRzAXyvbrbXaUwdz8qfIf85k3hGQNCV1nI+
	ZIePTiJBHGRK0693Cz9J5Ti5cM2qXS3bz98mWbRWY7oeMk1uNPPW
X-Received: by 2002:a05:622a:4c87:b0:533:983b:e53f with SMTP id d75a77b69052e-5359fdf6878mr201808461cf.59.1791894742961;
        Tue, 13 Oct 2026 05:32:22 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::662b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b62225sm24417606d6.19.2026.10.13.05.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:32:22 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: Ramshouriesh R <rshouriesh@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Eduard Kulyk <kulikeduard89@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] media: Add Himax HM1092 mono NIR sensor driver
Date: Tue, 13 Oct 2026 08:32:20 -0400
Message-ID: <20261013123220.17716-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013-hm1092-driver-v7-0-d81a9b152ffd@gmail.com>
References: <20261013-hm1092-driver-v7-0-d81a9b152ffd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ramshouriesh,

Thanks for carrying patch 3. Two notes:

The staging/ipu7 format patch mentioned in the cover letter is dropped
and not needed. With the ipu6 driver from media/next the sensor streams
Y10 648x368 at 180480000 on Panther Lake (IPU 7.5).

On the crop: I would widen the crop bounds to the native 1296x736 array
and keep the default at the 1280x720 active area.

Jake
