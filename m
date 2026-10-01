Received: from mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6BD526A8D
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 17:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790876204; cv=none; b=YmNQ0L46gbo/Zsxr926XXLo2tRVNea25/yuaFZ6lCKqmyrJaeOrXj0Sn9nCcZ9F8bXfA+qzZh59Uyo5A7TsK/Wm3ED8BLGlsYCwHa6aX6BRKLE16nKDt4QEkTno5I5khIheFAR9nKiN9jeWb0PcY9f9v9W2k6uOT0MuK+whiwM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790876204; c=relaxed/simple;
	bh=1S97aZ5lqXhW4kBuXjOjGy0qBmexZE7CglrgJsyPvnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jy3I90EZgMvZ6wP+MLnirE+bwKUSTe74fs3qce54zPGl2/+j1AIgKSb4qyw/2FLk3GwIRqf5UB+mBuzR+vDrpJSb/BiTyMDuNBoGiNan991QcbB9Om2yfeylWU/T1tFZ9/34aTgMQQteuEvRCjL71OhfJEtDISFupLYqJOzlQ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=Y55wQwAV; arc=none smtp.client-ip=91.218.175.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="Y55wQwAV"
X-Envelope-To: linux-media@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1S97aZ5lqXhW4kBuXjOjGy0qBmexZE7CglrgJsyPvnY=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790876199; v=1; x=1791480999;
 b=Y55wQwAVU5NyiMLjmzQs5YxkE383hNNktO0WHGn47RJLsGXdIUcVbp6An7Sw47e6uU14md6g
 4rKD+gx466Bo4wnMZqOdabJc9TCrV6s3DWDKDKXxQ1EtWsNaZxd76U8s4j7JhphLZwmh+L0u0Gc
 1WqXinNUam9G5UgM+dEfJB73disd2Jzrk7lxOaodRDpNo7Kp17LkR2gjs7hhuOwUvFOaKGf8nxC
 kleb/69b7aKoDwB4H72TVdH9YYaUKSxnUne/iD0Q+TzrJDU/hhUkutryp7iGRxUeWrOUc8xr0py
 ylQznPCzzegwvQrJ/AHsk8+uYtdDWR95FQfCuVQ9Rzn2Q==
X-Envelope-To: linux-media@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e9cad268562f180b;
	Thu, 01 Oct 2026 17:36:29 +0000
X-Mizu-Trace-ID: e9cad268562f180b
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Jacob Chen <jacob-chen@iotwrt.com>
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 0/3] media: rockchip: Modernize PM_OPS
Date: Thu,  1 Oct 2026 19:34:50 +0200
Message-ID: <20261001173610.158931-1-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bunch of new PM_OPS macros got introduced in commit
1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate old ones")

Straight up copied from that commit message:

    These new macros are very similar to their SET_*_PM_OPS() equivalent.
    They however differ in the fact that the callbacks they set will always
    be seen as referenced by the compiler. This means that the callback
    functions don't need to be wrapped with a #ifdef CONFIG_PM guard, or
    tagged with __maybe_unused, to prevent the compiler from complaining
    about unused static symbols. The compiler will then simply evaluate at
    compile time whether or not these symbols are dead code.

So convert the rockchip media components which used the old macros to the
new ones.

Diederik de Haas (3):
  media: rkvdec: Switch to modern PM_OPS
  media: rockchip: rga: Switch to modern PM_OPS
  media: rkisp1: Switch to modern PM_OPS

 drivers/media/platform/rockchip/rga/rga.c           |  9 ++++-----
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 11 +++++------
 drivers/media/platform/rockchip/rkvdec/rkvdec.c     |  9 +++------
 3 files changed, 12 insertions(+), 17 deletions(-)

-- 
2.55.0

