Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA45E31064B;
	Sun, 31 May 2026 18:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780251842; cv=none; b=g8VTo5U/J/PXLRu+z1o3w6AsUFfV2yecfTWvf9psqv9f994xJL27RA7UE0+kXm9QboOr4mIjDb4mKY1HVZmU/QQDf2Ts5714KlMXkRS0+tCwaPpqvLMdEdqNa0t0fVsM715b6z5NrXootHC2ZpaipM3k8CsG1P/a/PI8k++NIsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780251842; c=relaxed/simple;
	bh=u6Gnsp5YX/P/2cul78l6TYQ5s4iJmQ+TcRIlr93/ry0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kzMI6mA/HR3Ldb+4YOFq16/vlN/DimzAIR7XzDEDmyD0z5/ZzKtPgI4qEXXidcoPGKcRcwoHgbtNr6d0RCzGJBEyc6P5YYSkH+lilgw5w71BFAv2MA/rkphQewztKL5BvVE8dKrJXgZptuKvGpV+XGVQmRU3cvodH80x+zoGho8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2d9YV0V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2d9YV0V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103151F00893;
	Sun, 31 May 2026 18:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780251841;
	bh=spFxdIp1Q2JtESqOsQVga32XF0FyItY8A3JSSyc8nkk=;
	h=Date:From:To:Cc:Subject;
	b=S2d9YV0VcuSYRyUUNFmP85HfPRvgyZS6GF1vJiyK315QFLMU9I3aghSaq+3t0Duur
	 hrTJedQd9tIxbTdC5pFg4RdnR3xAqbXTSG7pPCOA1kizj28CU+TDQGXovqr6dWDdlg
	 MwGBCjqrkBj9yFDHGS6wsZrsKHfRJft3eSg80o0yIDDGcQ9Q08d/qQcNb6+m3K3ack
	 byrVr3X+zlhbSLMOCtTlrGsu3tvY2njr/XhcgRsC+GWqev9wbEyYFstbVcFayffo/R
	 AFfdFlE4kIxISkHjtCT3A54ykcdaGWwdIn9RJgQP2bXkBqJjrYhr9YPMCWZQRLAUAF
	 7SEyX3hLYlINw==
Date: Sun, 31 May 2026 20:23:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [GIT PULL for v7.1-rc6] media fixes
Message-ID: <20260531202357.4756568c@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.1-4

For:

- rc: igorplugusb: fix control request setup packet;
- vsp1: revert a couple patches to fix regressions when setting DRM pipelines.

Regards,
Mauro

---

The following changes since commit 646ebdd3105809d84ed04aa9e92e47e89cc44502:

  media: rc: ttusbir: fix inverted error logic (2026-05-04 08:33:39 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v7.1-4

for you to fetch changes up to 171022c7d594c133a45f92357a2a91475edabe20:

  media: rc: igorplugusb: fix control request setup packet (2026-05-30 18:21:47 +0200)

----------------------------------------------------------------
[GIT PULL for v7.1-rc6] media fixes

----------------------------------------------------------------
Henri A (1):
      media: rc: igorplugusb: fix control request setup packet

Laurent Pinchart (2):
      Revert "media: renesas: vsp1: Initialize format on all pads"
      Revert "media: renesas: vsp1: brx: Fix format propagation"

 drivers/media/platform/renesas/vsp1/vsp1_brx.c    | 10 ++--------
 drivers/media/platform/renesas/vsp1/vsp1_entity.c |  2 +-
 drivers/media/rc/igorplugusb.c                    |  2 +-
 3 files changed, 4 insertions(+), 10 deletions(-)
