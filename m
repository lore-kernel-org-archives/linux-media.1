Received: from linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4750737E5D8;
	Tue,  4 Aug 2026 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785843995; cv=none; b=NjZaVyfUUIBPTdNXEqgocPJx5ColIXNfoM0r7k+5Mk8dACuWFSMd0j8pMt+XoSFYpmHezwBGPnt4O+YJN9mFkEN90McCHjI/tprB2yd5zIYMxfaduGtL/eZF6XnM5qkSTxQV0MOVOy4fo75GuhdYzEWmlNqrIQAOKVapqafvCoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785843995; c=relaxed/simple;
	bh=7iioAyvkpHOAF0A9XAxGjSsn1pe8n+qfiu50Xeq22xc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NJBvYi9xGyZ0gVAi/v+1R0VzmElQmA8c/w9iFDesj9nEc22I6aWXTPFcBLmkwoIYAALeGT544lPAvXExh/zs0ef8gJwfgQCSCE9qBQnvYHOg1EHOEq5bFmJZEQpwIwbDxeo/lHfBMzRSZRJdFlyoOOYTR6nioFtqpohgXzxi2nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 49A4670A03EF; Tue, 04 Aug 2026 13:46:31 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: linux-media@vger.kernel.org
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bradford Love <brad@nextdimension.cc>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Remove regmap_config struct from allocated data
Date: Tue,  4 Aug 2026 13:46:20 +0200
Message-ID: <20260804114625.2314430-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a follow-up for eeafd9e12144fb6249e1510f9db8a4aaf8155a0a, after
which I found a bunch of regmap_config structs defined inside of other
structs, even though they either completely static (in which case I put
them in .rodata), or needed only a single dynamic argument (in which
case I put them on the stack of the function using it).

I found only these three instances in the media subsystem, which removes
192 bytes from the allocation of each of these driver instances.

Link Mauve (3):
  media: rtl2832: make regmap_config static const
  media: m88ds3103: make regmap_config static const
  media: ts2020: put regmap_config on the stack

 drivers/media/dvb-frontends/m88ds3103.c      |  9 +++++----
 drivers/media/dvb-frontends/m88ds3103_priv.h |  1 -
 drivers/media/dvb-frontends/rtl2832.c        | 18 ++++++++++--------
 drivers/media/dvb-frontends/rtl2832_priv.h   |  1 -
 drivers/media/dvb-frontends/ts2020.c         | 15 ++++++++-------
 5 files changed, 23 insertions(+), 21 deletions(-)


base-commit: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
-- 
2.55.0

