Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564C33BED2D;
	Fri, 27 Mar 2026 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774601687; cv=none; b=A93EUC+ZZdXoNnFT55abxqQanWTkpS0+MVkj6vn3tsjGpatswBoPdw/khChFp6+yItwYm5yhgkjIXKNNyBsarnZ9MakEimrFIj6c4jiPqSypUUVHj5+WtgA+I63EoBQPmq0xHZMvkxVxlYBbwsR+BGGbMCoSBef6d/iqoko7Fcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774601687; c=relaxed/simple;
	bh=FgCXVqjPnKtuGaF9y701i7l47B3+jdfLOe5EWKqVqyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GT1+kXSBPRGI/zCqfhNYhlQefBVpeEvkBaBZgQxIGkgc42SaZ2zgo9WyckBZEQgy150VA9W37PJhOpbAVnyV5pSA7aPMyiZ4uHeQ79cm2mJ5pvp5q8GGDWdIbqr+ANXSyGqEhiSyH0k2Ac+17d32FwKc/Gdx54JQHMam+duXN20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=San1SUN6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="San1SUN6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8CAC19423;
	Fri, 27 Mar 2026 08:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774601687;
	bh=FgCXVqjPnKtuGaF9y701i7l47B3+jdfLOe5EWKqVqyE=;
	h=Date:From:To:Cc:Subject:From;
	b=San1SUN6cmYpNj3fYcu85BAwxefXupIa29S5iQz9iNWLna2sd2zTeVPGrE5juYWIt
	 lU/uHmSGaG2f4irToCroAODe2QxnRlwo9Ut9MVFvQ/OkgKCLOTX9L0IeQI/NHlvSHu
	 BIzaBaUDlQBwKF7g54OmWNicXWVS9M5UtY8+Ny+C3eqPD1RJhToeNjL32tQ/ivLSB1
	 Xl28VsRtOqNmPUMAni4sJjbdqOtzqUBP3ig0Ivqow9v7MVi0WzQH7YL+2sG5MEZTtw
	 Ei9n7BlmXqlfWTZgQcnOZPJnTFDoUPmJRuN5g5jZtB8mEvc6hDQcD60Q5n3HLWyVBg
	 thE9pA1gdP5xw==
Date: Fri, 27 Mar 2026 09:54:42 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v7.0-rc6] media fixes
Message-ID: <20260327095442.4ccd1b21@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.0-6

For two regression fixes:

- uvcvideo may cause OOPS on out of memory;
- remove a deadlock at ccs driver.

Regards,
Mauro

---

The following changes since commit e8d97c270cb46a2a88739019d0f8547adc7d97da:

  media: verisilicon: Fix kernel panic due to __initconst misuse (2026-03-18 13:17:25 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v7.0-6

for you to fetch changes up to 7587fbf5adc23d180a5ea9aa6944292c22328703:

  media: ccs: Avoid deadlock in ccs_init_state() (2026-03-26 13:14:07 +0100)

----------------------------------------------------------------
[GIT PULL for v7.0-rc6] media fixes

----------------------------------------------------------------
Ricardo Ribalda (1):
      media: uvcvideo: Fix bug in error path of uvc_alloc_urb_buffers

Sakari Ailus (1):
      media: ccs: Avoid deadlock in ccs_init_state()

 drivers/media/i2c/ccs/ccs-core.c  | 2 --
 drivers/media/usb/uvc/uvc_video.c | 9 +++++----
 2 files changed, 5 insertions(+), 6 deletions(-)
