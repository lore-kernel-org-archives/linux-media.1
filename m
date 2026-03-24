Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E4337FF76;
	Tue, 24 Mar 2026 16:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369104; cv=none; b=MBlHA38KhtJii/0l30Hu1p/9Sose1BD+Qq3Y9ZiEhWPLgUNOrP2Ta4EWxhtdnozrfGyjz9xiCSm+hez+ZSIZ8hOShmAt6T/VqnAJYqj8pkr7mbIsezs18D7snddoLwL7qX0g/iYbA0uP0UutnL6dfvoKjysHNNtD+NNuAdzNZTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369104; c=relaxed/simple;
	bh=LlVeOfDVevG1mtL5gPrbnLLYTM883Ynrytxdj0M10CQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=XiQ2nBVNKOlQieZrYM/v9psSaqcj6xVmbXF8ZnToVzw4BEjWXWiJb0a+5Gw3TTUMRk6VnkS1w65Dekq/ziK1Xv/ma0eTowS/915EXSGqOKjYAfGNRlVoO/wfV9FGUJ904g9Vo8g2l203+n0GeXubvHmlI6ju3FAdFiDQQuj396E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfD7a256; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfD7a256"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5FAC2BC87;
	Tue, 24 Mar 2026 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774369104;
	bh=LlVeOfDVevG1mtL5gPrbnLLYTM883Ynrytxdj0M10CQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VfD7a256EhOAMTm28uRlGtoSior3AiYJqFQtMM4OzDlfJPsJeTihmtGMmyvxd4Wox
	 VhbF+bjNr/CAR+hOp9CNxqBQ9c+zFFW5u3CoFxgbvsPFDPm74fMR15GXIQrdG/mIJy
	 yFMZkLy2MELqJOpdS6+CHPN0bGh442A1IECGpQuiQz/QZ3SpgHH85ocv2a6oimPIN1
	 r5m3zZ9XZOfptJhzN+uZlF165Oj0zK9ddeMPl7MXXxLrOL8jRz+kXWwEWru+3ksmmA
	 jRutE1fZWLqlyDD8g7uQZwp/ps2zX/PUkRhWuD10HWJPzYa5aTTFuJZDkeY5febtSi
	 4ud23rLTLsGZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE703808203;
	Tue, 24 Mar 2026 16:18:13 +0000 (UTC)
Subject: Re: [GIT PULL for v7.0-rc6] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260323111101.098ba268@foz.lan>
References: <20260323111101.098ba268@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260323111101.098ba268@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.0-5
X-PR-Tracked-Commit-Id: e8d97c270cb46a2a88739019d0f8547adc7d97da
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 97a48d1aab549acb9b7f4a80d484f59710643199
Message-Id: <177436909179.1187739.12682489810527531290.pr-tracker-bot@kernel.org>
Date: Tue, 24 Mar 2026 16:18:11 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 23 Mar 2026 11:11:01 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.0-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/97a48d1aab549acb9b7f4a80d484f59710643199

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
