Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68488292B54
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 13:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296035; cv=none; b=HxDI94dVCOnZoKOA/uJzPt/WmFT/4ZTwBiOE93L3Mig202D2m5Hmo8tDyByYuunxi5cGwi57zJ+PoTVwkCUrv92eRYGw5k39B4kMK+zS4r5aGbbpyMEtI1ByMIr3cQVTFKyggLuJPFGwn3ce/AhIEz1wf23HmtSgvoFZV/5C884=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296035; c=relaxed/simple;
	bh=zVPGhT0rdrMd/hl3zJwvA67NDQcfiyd23aMrHv31Fgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YTgw6X4Xe2MN+fGm6AEELyl8WB3wukN55tNkxj5H2Dld5B1ML44QkRPgOls6m5/oM+rpiyZ92NgpRXduiuyLSI84cQ/bmudUTSrVAnw51U3Eswp6Wy/utt3iHCAmpDeMGgfUVq9u6YdpTUsT6zlv5WBupO3FKI1h7tsO7/zfmqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCxOCcP7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCxOCcP7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE141F000E9;
	Fri, 17 Jul 2026 13:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784296034;
	bh=w15Qa83IU7Bx7Bl9tNejLrxcVN0E2dqtN8WsAhx2UbY=;
	h=From:To:Cc:Subject:Date;
	b=hCxOCcP7f6cyyzmYu8smkhWMiWH3cGPJ6rXNFX06WcKdXTsQjMVLaD3BYfnw1YLh7
	 2ismibL80jfevo6rIphjPRL/q/LDzaj9+LwdLEiB1Z7Y7Bs6IOWru3oHorpeAWs7VT
	 FRC4gjiCRKpzPn7mHnbq950YJtnV52lsUu0lxXYXQGLn0/bp71fJxpc0xp7CzEF49O
	 RuXxAiyB8hywC7Sa/XEb1lOm99ZYBByEG2Dyi8ObyECZvj1I4Tl1u68GPoHhhfnWWO
	 3uHGQrXiZNfsyQN3KlZC68uNoUYwKD4rX7a0j+EROK+xrWjZpPpy0xGZHTIXJspfk0
	 2YdvT1RtsfMVw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ma Ke <make24@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH 0/2] media: Revert 2a934fdb01db ("media: v4l2-dev: fix error handling in __video_register_device()")
Date: Fri, 17 Jul 2026 15:42:44 +0200
Message-ID: <cover.1784295766.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

That commit exchanged a memory leak with a double-free scenario,
and it is not something that is easily fixable. Revert it, since it
is still better to leak memory than get into a double-free.

See this email discussion for more info:

https://lore.kernel.org/linux-media/20260520090624.1071139-1-lgs201920130244@gmail.com/

I tried to come up with a reliable method to handle this cleanly in the
v4l2 core, but the only way to do this properly would be to split
video_register_device into two parts: an init and a registration part.
And then convert all drivers to use the new functions.

That's a very big job, and so for now just revert the patch and add comments
explaining why it is reverted.

Regards,

	Hans

Hans Verkuil (2):
  Revert "media: v4l2-dev: fix error handling in
    __video_register_device()"
  media: v4l2-core: v4l2-dev: add comments on device_register fail.

 drivers/media/v4l2-core/v4l2-dev.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

-- 
2.53.0

