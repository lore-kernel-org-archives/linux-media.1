Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9223B71B0;
	Fri, 17 Jul 2026 09:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280280; cv=none; b=nZ4ny7Y73ZfrWwQZE8FkgNpGMuoCPyN1gTGUGEP1YmV8BjAmnU6v0FGg6d+krd2NhmmTqUauexfFR13NIKtQXgD8WeL49K7AdIuo63kdIJfcm02wWxDv5Npyrko5Of9z+0j3ZH7GP0+gvEJAZKogxXaH6Jg/uYJi+sEUe8z4dFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280280; c=relaxed/simple;
	bh=jgX4Fs/cdxEQP9YlwzekWXh6nZs1RHV+OXnnvp47Ubg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p1jCCU04Rrvd3ksvU1O5q3fMpg4jxYRRbcyTHPpzN//lU/NO+HYjaTvMpzb2i+/keK3Urcl4GBDT+22kFN3I6dz25NsEeRVWziIYISza2y0N3WrpgjgBHtvGiyayT1Jc4apQiYmvx+I0IutAGR5w/3ofve1IdJDgp2/Bym7SmSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TWoKiCkV; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TWoKiCkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=LZ
	rgXmL0C9ie8CYwpRqz1ibQiyohJzsQSFyPJpsHw6E=; b=TWoKiCkV8s5wcWKZ0A
	rX9F10BDgesvZnRHrrenAGqmsO7/Lxha1H41BiOB8uk+rPNyIap9YeY737Wkw+1U
	cs0TT3JJu+lX1YgGVyeKcKDOpU7QNFQu4oKTTFfbZkJLP1LxqRppuNPuCRTiSzpa
	fUXd2/YkOPoZJJ7I1zkPAT9OE=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCnESG+9Flq5w+gHg--.17942S2;
	Fri, 17 Jul 2026 17:24:15 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei814@163.com>
Subject: [PATCH 00/16] media: s2255: Coding style cleanup
Date: Fri, 17 Jul 2026 17:23:33 +0800
Message-Id: <20260717092349.684342-1-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgCnESG+9Flq5w+gHg--.17942S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF45Wr1DZw43uFWUXrW7twb_yoW5GF4fpF
	1rKFs8Ca9xJryFy3s2yw1xJF1fC34rJr4UGry2q348Xrn8Cry8Xws2kay29FWkJr97Zay7
	ZF4qgrsrGa4Yv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRAgAbUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC9ABeVWpZ9MCE-wAA3D

This series is a follow-up to the "media: s2255: Fix firmware parsing
OOB and cleanup coding style" series (0002-media-s2255-Rename-CamelCase
-goto-labels-to-snake_ca.patch). It builds on the changes made there
and should be merged only after that series is integrated.

This series applies a series of coding style cleanups to the
s2255 USB video driver (drivers/media/usb/s2255/s2255drv.c) to bring
it closer to the Linux kernel coding style. The changes address issues
flagged by checkpatch.pl and general style review:

  - Rename remaining CamelCase identifiers to snake_case
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

Lei Huang (16):
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

 drivers/media/usb/s2255/s2255drv.c | 375 ++++++++++++++---------------
 1 file changed, 186 insertions(+), 189 deletions(-)

-- 
2.25.1

