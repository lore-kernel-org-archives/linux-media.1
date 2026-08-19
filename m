Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A205400961;
	Wed, 19 Aug 2026 08:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787126417; cv=none; b=dtDdbZsr8nQjXDoeMEhc3E7cM+CqCL0PF1agb2u3Fav40c1fRFAWrUh1VkHm6GeTQzNlu0C7nZjC5U+4cJHxJgiWt1z4yxWWb60lscAtAXkLYqc7+Z8qMIPBtu+/YkQbefIfKVw9oLQRjQ1nmYDOTU7SoYz/6zxKaCbgAqkvURU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787126417; c=relaxed/simple;
	bh=qy5EFoupL6TYJ0xYLsTO9sh61L/YNuGarTsUYRaktYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lh2+CwB98QzKUPh0dV4YaMnwuOVja/QP7NgmllbcZVGfum+yQzTdhI8qUSgfB00CMaz+Txo888WD1Q3m9Rt74mm/uWUzBJ6YJ6jw3/X9TGXNkJhuiJLJPNnqWLfRYjefeJXscxihQ6unPYk5jYhc1Oz5x8GH04nRBkyDOzS4TSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l/XHDztB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l/XHDztB"
Received: from ideasonboard.com (mob-109-113-29-237.net.vodafone.it [109.113.29.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D34711552;
	Wed, 19 Aug 2026 09:58:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787126327;
	bh=qy5EFoupL6TYJ0xYLsTO9sh61L/YNuGarTsUYRaktYI=;
	h=Date:From:To:Cc:Subject:From;
	b=l/XHDztBQWZD4rZTHjweYma4W5GLM0CH/N+tzsQsRIo+6HxSs91JcuAaR2AhlV0A9
	 xcmJhhecbhb9Bp+WE/f80bkB65CUKZtwrwNvTJ4RewUlqHx5cBVAubiRtR+igaJjKW
	 CtqxlGU0f9ZfJrZ4uFbYPfX2tatwisp6YUXC87ys=
Date: Wed, 19 Aug 2026 10:00:02 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linmao Li <lilinmao@kylinos.cn>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL FOR v7.3-rc1] Late fixes for rppx1
Message-ID: <aoVhSUBRoEWM57n0@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Mauro

The following changes since commit 4900cad020c0580dfb1be27776ff10a4ef110cfa:

  media: ipu-bridge: check all DMI entries when overriding sensor rotation (2026-08-11 09:07:21 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/jmondi.git tags/rppx1/v7.3-fixes

for you to fetch changes up to 32d2d33c7d6db063a9c9802b6a7a660665056d16:

  media: rppx1: bls: read the raw pattern from the PRE2 acquisition module (2026-08-18 13:41:15 +0200)

----------------------------------------------------------------
Two late fixes for rpp-x1

Two fixes to avoid holes in the parameters array and to fix the BLS PRE2
path.

CI pipeline: https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1729054

----------------------------------------------------------------
Linmao Li (2):
      media: rppx1: describe the MAIN_POST white balance gains block
      media: rppx1: bls: read the raw pattern from the PRE2 acquisition module

 drivers/media/platform/dreamchip/rppx1/rpp_params.c | 1 +
 drivers/media/platform/dreamchip/rppx1/rppx1_bls.c  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

