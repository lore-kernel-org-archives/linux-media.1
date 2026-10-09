Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6404156C6
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540669; cv=pass; b=McdVrG6KlcTwh/u/lQtlfD7gFZzHKswIt5ttQTadsKQ2R1P7ZTEQWrxYUlA17UndcPuodEn1iVRaKm9nBYaufy54fkEANqQyCjydWvZbgil98cSK54NE4hEPWDgGgZg9KrjLUjwvkdsXD1hMLPpb8qmqCnly5Favc/EVlTVsEPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540669; c=relaxed/simple;
	bh=v7iJmty2kXgIegOHVpCdc922Bn4Tmq1n5G/dQmoYvtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vu5bc8GFIoifJretl9kwL0/W3b9Mx0fQLDLf7FOyXOKQFrpFQmcVHudVRG1UtMHSR9V2KWJC+COnaRu1jxBrToUJYJcSVLhLNd51L7ybexIzXL81oNA8gUV2XxMxBPpD6nNvkfKFv4ly+BZzNkFtZUHjqcx7CUiCe9XzBhWPZvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=RNGH3E3C; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="RNGH3E3C"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4j1N0v0ym3zySX;
	Fri, 09 Oct 2026 13:10:54 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1791540655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=ASlQ7P+AaXI9VBArCGLHpF+8NCmTfUz4F5wK1xkxgRA=;
	b=RNGH3E3ClOWlkHgivSh4CcodLiI+uxCklO8ZS8NGQI2h2Dut2ZW16YXOU06t51ufodCx7U
	ZMvWsgYhrPo/QYGpDwim8F3wNtRALWXpm+IBSRvoB54iwGCBUYZSSxDH37Q9TfveMNCKB4
	HTDHsNg4VmM1FZ5aWMPuEp8KfJiW/Kw=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1791540655;
	b=RW2Stta8T2ao20UnQmZSRSy30SFBeQaNoIRnPpMMETEy/WzuMTAhPbZORg0EI0i2cEyWX0
	hnW4OpFiCQs+kFCoXLmZbkgUPeRLLBzkAZrWF8i2wKfV7lPWj4Ta356eROK/C0upIo14vb
	r67uKosO4NhvvRz/zSdPwLTHeEFwB1o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1791540655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=ASlQ7P+AaXI9VBArCGLHpF+8NCmTfUz4F5wK1xkxgRA=;
	b=yFpA7veiH2RKzXe3kf5wBFkqbIMDztRiftpEkBi3AY6YWlAOv62heMICUPV8SpM9j989fn
	90R/oQtZs6uL7evPB32dpeB9AcdPUwdd00fbUR3AIlpSJ+alnaieE4Lh6ZDnnuAn+q1ete
	FmhpLhfdtskukil8gJfc1tNhA5/3cLo=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 81A87634C4E;
	Fri, 09 Oct 2026 13:10:54 +0300 (EEST)
Date: Fri, 9 Oct 2026 13:10:54 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT FIXES FOR 7.4] INTERNAL pads, sensor driver fixes
Message-ID: <asi9rkESsh8EAMbO@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Please pull.


The following changes since commit f39567cc92272f987c056d8c92f7c93f3fdf53ef:

  media: i2c: imx576: select VIDEO_CCS_PLL to repair build error (2026-10-09 10:18:37 +0200)

are available in the Git repository at:

  git@ssh.gitlab.freedesktop.org:linux-media/users/sailus.git tags/fixes-7.4-2

for you to fetch changes up to 6293ca903d3e6bd2452b728980a74f1be731d9bc:

  media: i2c: imx576: Fix line length register (2026-10-09 13:03:51 +0300)

----------------------------------------------------------------
V4L2 fixes for 7.4:

- Various ov05c10 fixes
- Fix for imx576 using wrong register for line length
- Make MEDIA_PAD_FL_INTERNAL kernel-only for now

----------------------------------------------------------------
David Carlier (1):
      media: i2c: imx576: Fix line length register

Sakari Ailus (6):
      media: mc: Keep INTERNAL pad flags just for the kernel, for now
      media: maxim-serdes: Disable test pattern generator for now
      media: ov05c10: Small cleanups
      media: ov05c10: Set reset GPIO high when acquiring it
      media: ov05c10: Power management fixes
      media: ov05c10: Remove duplicated writes to analogue gain register

 drivers/media/i2c/imx576.c               |  2 +-
 drivers/media/i2c/maxim-serdes/max_des.c |  9 ++++--
 drivers/media/i2c/maxim-serdes/max_ser.c |  9 ++++--
 drivers/media/i2c/ov05c10.c              | 55 ++++++++++++++------------------
 include/uapi/linux/media.h               |  6 ++++
 5 files changed, 45 insertions(+), 36 deletions(-)

-- 
Sakari Ailus
