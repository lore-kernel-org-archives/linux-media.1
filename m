Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD093B38B9
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 15:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572054; cv=none; b=RxNL887C3h1td5aiKH+Xa9AoQ4opTDJZOkmmvBrijoZKt1rNplcLkt3FbMmUk+3fVMfaM/8qmpIkDotyKNUuHvut9N2VZN3Ml7TbThzUb90osbSBIXREDimuvDkrWr8jsawzQWXElLr85lZlf8ExxhXtlQjW6ZwL8pv8eePQCss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572054; c=relaxed/simple;
	bh=ACGJk+McZv3PxQytrrgSqAg8ODbh/coRRhoET9ueCy0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=OYbMed9DUnNHcQ8s+8wnKnmcV7qRl1PUIkDZlBo3Z5HNTfnIo7CPiDy8IsVApE19oDsNUQ6itoBfgdaaSFu/KqWcyRpa1r5cSwvdabo/sNslMox+Bq5KCqow7YtDSU9zoM12vJ1GFo+lsxcFaG+fqA1cQ0KN4Ebyo2lWq+Ch4BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ioBt9PhH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ioBt9PhH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789572044;
	bh=ACGJk+McZv3PxQytrrgSqAg8ODbh/coRRhoET9ueCy0=;
	h=From:Subject:Date:To:From;
	b=ioBt9PhHX16h3umoVXJhgn8MvGPFbP0w530jAgUwYC9/CNSljlG23xi5z+eqapdT0
	 AqUCxVqaDCEWOOQUHgj8EDBn4Rq4y5OZEC+XOjcQU6hkocSglys2YKtzRt4OePQcAU
	 +8nz8KTVmPkbKUsKH1nx9ebfY2hFkRDGCYkQzBaIFk6mUiGdulhiZDs+eeklLvZVtj
	 +H9PS6ecwf1SKFY7IaS9thGS9AmcbTP4p0+W3tkcb/MqCWo0tfkIyazkvLBmb+1XyU
	 KAfaxbmTDgtw9PTzSaNsnOWxCaYGmNvpPsemQkgfMsUOTLGGMAOSTIDIaSJTnVl3+m
	 l+9f0wffzykkw==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D413317E0420;
	Wed, 16 Sep 2026 17:20:43 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH RFC 0/3] utils: Add the v4l2top tool
Date: Wed, 16 Sep 2026 11:20:41 -0400
Message-Id: <20260916-add-v4l2top-v1-0-470629ba5ffa@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MD3cSUFN0ykxyjkvwCXTNzQ0Njg0STFBPjVCWgjoKi1LTMCrBp0Up
 Bbs4gMaBa3dKSzJxipdjaWgBEC8X6bwAAAA==
X-Change-ID: 20260910-add-v4l2top-671130a4d43e
To: linux-media@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

Hello !

As we are currently adding support for fdinfo[1] and memory tracking[2]
in v4l2 drivers, I propose the v4l2top utility to show
media devices time and memory usage in a nice TUI, much like htop.

The tool is written in Rust and only built when cargo is detected,
using a wrapper in the meson build system.

Currently, the code has been copied in the tree from my git repository[3],
but if needed, we can use a submodule or recreate the git history.

As [1] and [2] have not been accepted upstream yet, this should not be
merged yet and be regarded as an RFC.

Regards,
Detlev

[1]: https://lore.kernel.org/all/20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com/
[2]: https://lore.kernel.org/all/20260916-v4l2-add-mem-tracker-v1-0-900fa45e3e6a@collabora.com/
[3]: https://github.com/cazou/v4l2top # upstream branch

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Detlev Casanova (3):
      v4l-util: Add the v4l2top utility
      meson: Add meson build file for v4l2top
      README: Add v4l2top util

 README.md                         |   7 +
 meson.build                       |   1 +
 meson_options.txt                 |   2 +
 utils/meson.build                 |   2 +
 utils/v4l2top/.gitignore          |   2 +
 utils/v4l2top/Cargo.toml          |  13 +
 utils/v4l2top/README.md           |  43 +++
 utils/v4l2top/cargo-wrapper.sh    |  22 ++
 utils/v4l2top/meson.build         |  43 +++
 utils/v4l2top/src/main.rs         |  51 ++++
 utils/v4l2top/src/renderers.rs    | 593 ++++++++++++++++++++++++++++++++++++++
 utils/v4l2top/src/v4l2_mem.rs     |  56 ++++
 utils/v4l2top/src/v4l2_metrics.rs | 148 ++++++++++
 13 files changed, 983 insertions(+)
---
base-commit: fa05ca502293f65e25930e6321c82eeaccf382ab
change-id: 20260910-add-v4l2top-671130a4d43e

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>

