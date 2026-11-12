Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508338;
	b=bhQERZ5Si/1UEMekrJV1Xwlog1HXu4EVeNuay6jZsIP1dS7gNubetVdFwNROQ/wXxmOf
	 QRqsMknY+fOM1yDUw9K/Ex4nySmuFVuqngCVKW2vUGtFImsK1oQqnXqhnhwRnNqIxBWTz
	 pbAq2RehR+VYzEwOgSDZCjsvZJO1QjkpA0D7G8+1IEug6fvqI/3IUIOv9LbDor6QCQLxl
	 Ze3eOZUY0LEhpURNasr58FvCE6hr0NRDqqURH0yWi+YxmO/ACrxRJ7JFquXwdHOayoDW2
	 ASaNlPRzYnhlksK1iqk5dupBoBXArJ5ZxrDdBdiXpcqaYbtRHTFnlLRCojcMOnG0SmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508338;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=b0Lucm+hZ+Xamf8aPSQeS3ZJjDBweLYJdUU1/vTOGFE=;
	b=DWJDPTCcNBFYnTCLZ0rlQXPuMLLKB0O5i1VTB35K8u5fvp6xFCLcHbjYkH94/Lmr2gZC
	 OXwO0nPMVTZLtXzzXpLsCynBV/BoumUkqTWRYW3CQkFo2gdjLYgA5aGOCLoyVuGmfIv0k
	 bg8IPmJ5mpdPYbDsDpV+36V9Y0g4e4Ac6fe5sW5/0kL7ldjUwYFBXKl59+/RFOohHQQ8P
	 yE7+TjaKqepOeitUlFHi7ccbpj6/KBbfJr6FhxxrKlpGi0R3PNpzdObgNvsDg27MkpysC
	 UonnTNc6pg1k+EoOzc+83OAouw2j3w8tKI696RQXb/H3B7RlO2fqAwLf6VrnOk+esag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O7i0Aj3k;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A850D606A8BA
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 18:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A850D606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O7i0Aj3k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794508338; x=1826044338;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hznyfIiura6IcOL4I9PqSnSq+HTGbpzE/IfezIbsoto=;
  b=O7i0Aj3kLmcSAON8Oe+8ReDbWTVYbruVJyl3NVmIUXh62c+V84FzGXA3
   AMpa3qcWDyf8dVbzj1uRHWrwyAwdkqsMDYfqCKh4Io1lMOGhXXC40rRZK
   /+pkPwn2tHryU/7S2HL/S4n6YXyMwSUmLoKSICyMVzAk79dDfWnjOh4UD
   yPNfyMkK0KFdAFnSr9WXWGyo9ko1/aO67elCaUKOrpAgkNiyf1viEPvsa
   H+gMRDelS0GPxT1sqFAxAV7jRzELUO3gM6/K62KFtsqrWAVsF9vg0vkQL
   RWxiByyVp1NYC5/DSAPqbu9vROuOLMz01NPWSakkkHlvMyHDEaR6HgVTD
   A==;
X-CSE-ConnectionGUID: Of36cMLiS+iqA3aVNZVyjQ==
X-CSE-MsgGUID: tVFiUTQ+R+yNjBO7OLDsVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3347775"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3347775"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 10:32:18 -0800
X-CSE-ConnectionGUID: vBw9BV6xT1uvh6hObXU/vw==
X-CSE-MsgGUID: AS9LdM2+RAKJKihV6F9uvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8618132"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.103])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 10:32:16 -0800
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: linux-media@vger.kernel.org,
	paul.elder@ideasonboard.com,
	daniel@makrotopia.org,
	linux-rockchip@lists.infradead.org,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH v1 0/2] media: rockchip: rkcif: Fix a system hang and validate the pixel format
Date: Thu, 12 Nov 2026 19:32:06 +0100
Message-ID: <20261112183208.2688580-1-mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Michael :)

Sorry for the additional work with this flood of patches...

This series fixes two issues in the rkcif driver that stayed long enough on
my TODO list.

I am using an RK3588 ROCK 5B with an IMX415 sensor.

Patch 1 drops the reset from the runtime suspend. The reset also resets
the VICAP IOMMU and hangs the system when the IOMMU driver accesses the
IOMMU registers at the same time. This was reproduced by repeatedly
starting and stopping the stream with runtime PM enabled.

Steps to reproduce the issue:
* configure the media pipeline
* You can use this script here:
--------------------------------------------------------------------------------
$ cat stream-loop.sh
#!/bin/bash
# Start and stop yavta in a loop: stream for a random 0.1-1 s
# Usage: ./stream-loop.sh [device]

DEV=${1:-/dev/video0}

trap 'echo; echo "stopped after $i iterations"; exit 0' INT

i=0
while true; do
	i=$((i + 1))
	stream=$(printf "0.%03d" $((100 + RANDOM % 900)))

	echo "=== iteration $i: stream ${stream}s"
	timeout -s INT "$stream" yavta -c -f SGBRG10 -s 3864x2192 "$DEV"
done
--------------------------------------------------------------------------------

Patch 2 rejects pipelines where the pixel format does not match the
media bus code on the source pad.

Steps to reproduce the issue:
* configure the media pipeline to use SGBRG10
* try to capture with yavta using the format SGBRG12

Fyi:
Another patch is also needed to not get the timeout everytime the
streaming is stopped but some of the work on that patch is already done
in Daniel's 4th patch:
https://lore.kernel.org/linux-media/cover.1793702189.git.daniel@makrotopia.org/


Mehdi Djait (2):
  media: rockchip: rkcif: Don't reset the hardware in runtime suspend
  media: rockchip: rkcif: Validate the pixel format against the media
    bus code

 .../media/platform/rockchip/rkcif/rkcif-common.h  |  1 -
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c | 15 ---------------
 .../media/platform/rockchip/rkcif/rkcif-stream.c  | 12 ++++++++++++
 3 files changed, 12 insertions(+), 16 deletions(-)

-- 
2.56.0

