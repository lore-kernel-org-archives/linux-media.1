Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E5D3C768B
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 21:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784149800; cv=none; b=TqN910OzS7Q63TaizshfUERA0F5PPrN4AtpTLiS8NnURIRxaf2fpeXCjvlKt2JzwVSUC/c4gfo9naGnCRYmLRvelnaFlkQM/SP9CngF27KkPyoQsYQUeHuSmDhOTv3qBg5T4fv6t/yTZWIM3KM7jM6J468X57Gbm/02mCPaRmJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784149800; c=relaxed/simple;
	bh=shMRnoBr0+XGDcqbRPYU6jN5tQHJynUO5pZjVhXjOPU=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=kY7wWbExXwMycXm7U65dLPHAd/bNCmVC9StXhCmH5Z2sR9ha1jh41hJtToWHL8FNJx6/OH6gXyTiEcxCjQrs2EpQ7DMh8WXXmg6+8rhwFR8qR3WvBvBXJ9TmWaZDmjndtyTdhq6xkSPFZgNUyxJvMbY9oQGIAoef3uWd2BggCKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJ4avx0x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJ4avx0x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95AD21F000E9;
	Wed, 15 Jul 2026 21:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784149799;
	bh=3vDg2WtrUYMxyKFBd1fZ0wHxBBDEZ9SWmZlPkVGwBk0=;
	h=Date:From:To:Cc:Subject;
	b=jJ4avx0xdANwmTDwxsy0s3Vj+YDJBaVZXnhS2ZKAmn6szkGesr5r3t9ITEW92xhhI
	 zhdVBhXJHyIoIrqzBYeXvmv1tSuFazTUlBBSE36y79b0l6HldV5WoDLspD80cqfZ87
	 QE8Sx6XQLJT8Eel5r/mUBbfNdBnBlIdasPm7jamfHvdu742gw61f7O8OTWn/zRG1g7
	 bnWsjGlGe7kmSO7T4kC7/ByMdZ3jgypxTwfaZIPSk5W5GMxck14SJMf2L3sBmex5sr
	 437nKUzdqHoKlBaXmi9ywB0z7nqt/XhAQ49UnL4xfpmV3dVtouO369YmqfEgZj7Xto
	 zQJQp2OdQj4Fg==
Message-ID: <419c2b65-fd33-4113-8bab-1efddea6f410@kernel.org>
Date: Wed, 15 Jul 2026 23:09:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [GIT PULL FOR v7.3] media: CEC fixes/improvements + doc and vivid fix
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

This PR has one documentation improvement, one fix for vivid, and a bunch of
CEC related fixes and improvements.

Once this PR is merged, I'll also push a separate cec-compliance patch:

https://lore.kernel.org/linux-media/65a6bd5c-4e62-4370-b654-7dce0712aae5@kernel.org/

This uses the vivid CEC emulation and new error injection capability to add
new regression tests.

Regards,

	Hans

The following changes since commit bb03a00d68c147fe7b1fd1a8475c078613c30ec4:

  media: atomisp: Demote all broken kernel-doc comments (2026-07-15 17:12:55 +0200)

are available in the Git repository at:

  git://www.linuxtv.org/hverkuil/media.git tags/br-v7.3k

for you to fetch changes up to eb5fe5bde8cadade023adc03f3645c8da974ad14:

  media: cec/core: add error-inj-tx-timeouts debugfs entry (2026-07-15 23:00:02 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (12):
      Documentation: media: vidioc-g-ext-ctrls: clarify try/set behavior
      media: vivid: always allow meta output streaming
      media: cec: tegra_cec: don't break off msg on NACK
      media: cec: tegra_cec: keep track of number of Rx Low Drives
      media: cec/core: max_retries -> max_attempts
      media: cec/core: drop ABORTED/TIMEOUT check
      media: cec/core: handle core events like normal events
      media: cec/core: drop cec_post_state_event call
      media: cec/core: flush stale STATE_CHANGE events
      media: cec/core: add a new CEC_LOG_ADDRS_FL_CONFIG_FAILED flag
      media: cec/core: cec-pin: toggle rx_toggle when arb lost
      media: cec/core: add error-inj-tx-timeouts debugfs entry

 Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst |  7 +++++
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst       | 15 ++++++----
 drivers/media/cec/core/cec-adap.c                                  | 85 +++++++++++++++++++++++++++++++++-------------------
 drivers/media/cec/core/cec-api.c                                   |  5 ++--
 drivers/media/cec/core/cec-core.c                                  | 31 +++++++++++++++++++
 drivers/media/cec/core/cec-pin.c                                   | 10 ++++++-
 drivers/media/cec/platform/tegra/tegra_cec.c                       | 32 +++++++++++++++++++-
 drivers/media/test-drivers/vivid/vivid-meta-out.c                  | 23 ++++----------
 include/media/cec.h                                                |  6 ++--
 include/uapi/linux/cec.h                                           |  2 ++
 10 files changed, 155 insertions(+), 61 deletions(-)
