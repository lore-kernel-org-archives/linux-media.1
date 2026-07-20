Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623C12E718F;
	Mon, 20 Jul 2026 02:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516121; cv=none; b=YX70GHdS6fwEbRjaRrcVE2erVkp/Rr0S+dX+w+oOIpoDA93sE3xvkXJEogDjKyYO+vEwK9b/65K2Uv03PoTlX6rymSkm9nNCWmZnjOsiYveVjuJNFHgtFRPSu+/+VaNIOOJoa/gkVIRsttud9lJeAoM9bafclQKtANUiDJ3sm2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516121; c=relaxed/simple;
	bh=zgZzkhWZeDFxK0qc5c1OHOKT1LuDEN0p9JQhIfuEbfg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RhjH9tHWXh/UbfIVYeHlaICstTGuz87HdqP2zri0MjfUFbMqz+RyWTr9NcKiJhQmegfe/9gE0J/eLHBiMTP24JcBhSMWvm6EuHSE9ZyrTcAemKO+756iI+1PYWIZqqBtl1ZKg8QczTuiJc2rytp0o3D+IZrnt+cpAvQPVTpj3jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RazdPaCm; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RazdPaCm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=HB
	37kvVHno9BV4k4w7cIHVIwTAZjuMJ4VqPJ/r22pNc=; b=RazdPaCm8SIxX28RGO
	3EISmW27l1XbpYnXdC7zLaORVUiN44wZqBnf6fZTvSLs0MPf3x71UqHMbBKYBptd
	yubF35YbOvZ82rByPAQ87H1ilK9vXO9i7eiS3je4WN3RWNZJfKdIiwV4pz2WSkUt
	MqJGuGfkuMVWG9ahbzAZNb4jM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3v5rwjV1qaGtIJQ--.123S2;
	Mon, 20 Jul 2026 10:54:45 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v2 00/17] media: s2255: Coding style cleanup
Date: Mon, 20 Jul 2026 10:54:29 +0800
Message-Id: <20260720025438.207149-1-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v5rwjV1qaGtIJQ--.123S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFyUGF17CrW8ur4fKw1ftFb_yoW5AryxpF
	n5KFs8Aa9xJ340y3s2yw17tFn3C34rJr4UGryaq34xXrn8CFy8Xwsa9a129FykJr97Za9r
	ZF4qgrsrGa4Yv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UPpnLUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC0RWSiWpdjfXM0wAA3P

From: Lei Huang <huanglei@kylinos.cn>

The previous coding style cleanup series failed during
integration by the Media CI robot because it depended on the
"media: s2255: Rename CamelCase goto labels to snake_case" patch,
which had not been merged independently in the linux-media community.

To resolve this, the goto labels rename patch is now included as
patch 1/17 in this v2 series, followed by the remaining coding
style cleanups. This ensures the entire series can be applied and
integrated cleanly as a single unit.

This series applies a series of coding style cleanups to the
s2255 USB video driver (drivers/media/usb/s2255/s2255drv.c) to bring
it closer to the Linux kernel coding style. The changes address issues
flagged by checkpatch.pl and general style review:

  - Rename CamelCase goto labels and remaining identifiers to snake_case
  - Remove unnecessary spaces after casts and parentheses around
    conditions
  - Use consistent braces on all arms of if/else statements, and remove
    unnecessary braces from single-statement blocks
  - Replace NULL comparisons with ! notation and bare 'unsigned' with
    'unsigned int'
  - Fix alignment to match open parenthesis and add spaces around
    multiplication operators
  - Parenthesize macro arguments to avoid precedence issues
  - Fix block comment style to kernel format
  - Add blank lines after function/struct/enum declarations and after
    variable declarations, and remove extra blank lines
  - Remove unnecessary return statements from void functions
  - Remove unnecessary debug logging and out-of-memory messages

No functional changes; the driver behavior is unchanged.

Lei Huang (17):
  media: s2255: Rename CamelCase goto labels to snake_case
  media: s2255: Rename remaining CamelCase identifiers to snake_case
  media: s2255: Remove unnecessary spaces after casts
  media: s2255: Use consistent braces on all arms of if/else statements
  media: s2255: Replace NULL comparisons with ! notation
  media: s2255: Fix alignment to match open parenthesis
  media: s2255: Remove multiple blank lines and before close braces
  media: s2255: Add blank lines after function/struct/enum declarations
  media: s2255: Add spaces around multiplication operators
  media: s2255: Remove unnecessary parentheses around conditions
  media: s2255: Parenthesize macro argument to avoid precedence issues
  media: s2255: Add blank lines after variable declarations
  media: s2255: Fix block comment style to kernel format
  media: s2255: Remove unnecessary return statements from void functions
  media: s2255: Remove unnecessary debug logging and out-of-memory
    messages
  media: s2255: Remove unnecessary braces from single-statement blocks
  media: s2255: Replace bare 'unsigned' with 'unsigned int'

 drivers/media/usb/s2255/s2255drv.c | 413 ++++++++++++++---------------
 1 file changed, 205 insertions(+), 208 deletions(-)

-- 
2.25.1

