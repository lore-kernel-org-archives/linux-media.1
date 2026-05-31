Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C5B36A376;
	Sun, 31 May 2026 21:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780262042; cv=none; b=imgWgKXTf1kHnSFX3tN6mPN7NWJJBpJc2qOEkOPsqxEaX3TXP5UKEH5F5vFnZ9JvcbiivnxDMDyT/4I15adpLL/gCjbbZXiRcODSuYWoPAuVjNFRxNYZ4aoItWdv4EeetJfCQ5GkY6SQw4sseVCoMMq9IoqpVZ7czs4IHN9vmKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780262042; c=relaxed/simple;
	bh=a2VQBnSyBz3qPKOFwoM4vumiW3Z1OhvRf2rQwG15m98=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=W5BsvKeGwlgiBI9myBfRKyFgo5TkyxWw0aBpHWz6NH5utp05tKSNITkIdcYDGBAydBfK8jlYZiMO5fnkM0/Nx3d2YKaWWcrShwrQNkWqYrqF7/kq9CQ0tsBusQYUdQT9Wqz5LGUBpmH2X2wNnIycN7VnlmreKDgMZwfl0kj62To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vdqb9uPc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vdqb9uPc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2AF1F00893;
	Sun, 31 May 2026 21:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780262041;
	bh=200tK9Udd/6itN5T6Tj0aktSDT5g6k1kNs+WkJa54mg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Vdqb9uPcwXk7B41nTu0VEjWf4mwhZzu46k5gToxxdiLR9REXIM5qXHl4Ke8pXWKMB
	 E+yd3ny3yIEE4lhHf6pdfAsbkCJVXx0oTWqarlh8fbXF3mnZeW0L5FnqsXI+vFHOrR
	 Y9kqMnw3A6DglyyRgvkZwTY8FAra5uVQEOkCCP0CfgYitIL9C/4HSQ8nAAhKoLlVCM
	 gl2lQrcxv4nDa4chib1q4XmnwWFop4yqCg+VnybIO1iySBo8Szia16Qipcn5/+EqhV
	 x/ty46R1Ijj23/BrXWc4V4rRveTUIi+ET+0bcNpL01TwGxSAFxw/gBGmqurLGaGuNM
	 CuSa8o8ypJbCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B5439302F7;
	Sun, 31 May 2026 21:14:05 +0000 (UTC)
Subject: Re: [GIT PULL for v7.1-rc6] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260531202357.4756568c@foz.lan>
References: <20260531202357.4756568c@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260531202357.4756568c@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.1-4
X-PR-Tracked-Commit-Id: 171022c7d594c133a45f92357a2a91475edabe20
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8d9c51eac648ec953ea534b536d62337be3744b7
Message-Id: <178026204418.2979054.11994504439221294554.pr-tracker-bot@kernel.org>
Date: Sun, 31 May 2026 21:14:04 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 31 May 2026 20:23:57 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.1-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8d9c51eac648ec953ea534b536d62337be3744b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
