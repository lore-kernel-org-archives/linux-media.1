Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6738D47607D
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933781; cv=none; b=D3XteOB+4E6Req5E4xCQL701LUB0JPKLwTPlJiYafXmnlMSj/B+7cV80T2cMlNgRyI8gmg9lI/NFcc9BFdbfJ936ArblmUn8scydM4wfFoby9edGhggNJIK/1v1UmHwoxtDSDVrhnvGt+yrnpkiIaI6JXtVUjXSFr6x+4DblwlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933781; c=relaxed/simple;
	bh=yb0TdYtnwZ1tdLYldpVyyHJQmhmxHLxZco9LIpobt2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AzGtyy4t7mKxMJqO0OtHBS7JK+jPjLzSJdYGNi8p1W5zcqXToQf5me9g9t7zXHu4aF6qQmAf+tobrnKe6QUX9adi1mhjp4KxjlI6FVZz1cZIhoypFiACW3u6XUYsdRaPEouyszImLGwp85M6YLuYB3YAURLe4BSoAFU39+4auAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hehpjl9M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hehpjl9M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1681F000FF;
	Fri,  2 Oct 2026 09:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790933776;
	bh=vwyRh+c4xjz9C3NbsWsVEF8jFh2z8kUPZbg+Ayw/3x0=;
	h=From:To:Cc:Subject:Date;
	b=hehpjl9MlJz2yLqH9nBzN5b3f31fWUY1PkC5LvLPv6xf3fpHFu7vZXv/dEYdjEG5v
	 rfTZnnRVKxiZEpwJf3usXe29WUv+PDeUNnAUeyher3llRC7Hm0qD4jY8f/oXBXyPpH
	 5ZGAu84Q/KcdGrKdwzOv5MA54mwLMXVWi/sqqA5s2L8WlNlA0rQtmTULIwSMNMqoEE
	 wwV87460pPoh3hQ0A+oz2OoErbi+jQcGFfwxI3aBGstuTOWs8ysB/l0xuoBjZYiVXD
	 njHXYjv3iHDnHOxk1hHX2LHzf3Gk9VRvqhcDjTo3vYKkbm8M9x+IblQMS8jjLRwD8D
	 hTjniX9gOD4KQ==
From: bod@kernel.org
To: linux-media@vger.kernel.org,
	hans@jjverkuil.nl
Cc: bryan.odonoghue@linaro.org,
	Bryan O'Donoghue <bod@kernel.org>
Subject: [GIT PULL FOR platform-qcom-media-for-7.3-fixes] Please pull platform-qcom-media-for-7.3-fixes
Date: Fri,  2 Oct 2026 10:36:01 +0100
Message-ID: <20261002093604.27786-1-bod@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bryan O'Donoghue <bod@kernel.org>

The following changes since commit 8e757b5e7743163dc7d110efee25aba9bf79e267:

  media: i2c: Add Omnivision ov05c10 sensor driver (2026-10-01 13:58:56 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-media-for-7.3-fixes

for you to fetch changes up to 254e479dec5cb4587d9364f10d4572f5c6e4f76c:

  media: iris: fix 64-bit division in iris_set_slice_count() (2026-10-01 15:12:36 +0100)

----------------------------------------------------------------
This PR contains a single fix for a commit -next to address 64 bit division
on 32 bit ARM.

----------------------------------------------------------------
Sasha Levin (1):
      media: iris: fix 64-bit division in iris_set_slice_count()

 drivers/media/platform/qcom/iris/iris_ctrls.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
