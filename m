Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45FF3C7DEB
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 16:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661874; cv=none; b=BRKlSo20qZ3YFRGF1ytaT3KhuTJNXql0/F0u5wYmJUsL2KXFyLjy7q5N7QtFsqyolx2cDwKGsSprkAjYL8OViAgUfTa2f0psh2qmlomwtfBz4qx4l/M2VtyeiY+XqhbJ3/w45fzZDzG/Z3fdoEwl5JrZRXTN5zkhFJYYKMJBNxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661874; c=relaxed/simple;
	bh=CwCvTzT5/Wjk49sriuF1GcDDnoQBKgV0xYzkwzQNgb8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=Aj9g9SIg1fqqOhhY5ILF3fCE4KGdjNEX0FEJHha9JLFsCQxOpbmyQwbIorTIU/iBjNbag0fFHQu970Z7B74PcuUbw616UBjWcOdYQ98Z8cd4ddjYTQZdk6n0xgacRlu3Cl/33s17T4jKRNHYGRQtBPVrys7/UL4QmLlwEyS5O58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ex58wmMK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ex58wmMK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789661869;
	bh=CwCvTzT5/Wjk49sriuF1GcDDnoQBKgV0xYzkwzQNgb8=;
	h=From:Subject:Date:To:From;
	b=Ex58wmMKEnEerMU3bg6LP3IabIqqcQhmwU+1nnUM4rFSaSHMlbeECedsXph4Dgo87
	 4Ko+kcvFuIE9r4wXtJNlHTNQ3t8XIq3WMw9AldRwwnx9W7FcNrvfKplRFBqjSBLCvv
	 phv0gBy3DO3EIBpY3sgDsSN+kfBKhyi0tWOT4NURpQfdsEn35RINrsOV6civ5eLdEz
	 E/SBJx5zjHXoAmlqJ1aDQ005oOUzl/r5b8PIazBRhcwEKi0KBlsL9MzoEKEppNyIcV
	 K8KmmAv+HIpho4DaF+vydOfKUfI44+cHxAjhMhZNl+n6y874qKs3YgnZ58DNXrEHKY
	 ZeMY32d5mbuXA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65C3117E0420;
	Thu, 17 Sep 2026 18:17:49 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH RFC v4l-utils v2 0/3] utils: Add the v4l2top tool
Date: Thu, 17 Sep 2026 12:17:45 -0400
Message-Id: <20260917-add-v4l2top-v2-0-80970c6210c5@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNQQrCMBREr1L+2i9JGlPqShA8gFvpIm1S+yE2J
 alBKb27sbhx+YaZNwtEG8hGOBYLBJsokh8ziF0B3aDHu0UymUEwoVjNGWpjMEknZj+hqjgvmZZ
 GlhbyYgq2p9dmu8H1cv5muYvPmVyEJtNAcfbhvd0lvvV+ZvVnThwZyoopUbf60Pf61HnndOuD3
 nf+Ac26rh8lEro3vAAAAA==
X-Change-ID: 20260910-add-v4l2top-671130a4d43e
To: linux-media@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.17-dev-4066f

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
Changes in v2:
- Fixed subject tags
- No code changes
- Link to v1: https://patch.msgid.link/20260916-add-v4l2top-v1-0-470629ba5ffa@collabora.com

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

