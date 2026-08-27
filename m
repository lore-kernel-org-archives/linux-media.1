Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8402E2665
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 20:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861782; cv=none; b=C8X97tbrJZ6OGa8V+JL8dYqA/6BDFQLcnrV6Wxqxft6znOCf+lEadJURNAfFy6XYyiHXyOpbRSyq2C3PptZ1j7RgrvfTptJIzF2iu0BJ0iNas+MA28UCKUroZ1lcaiNR5OErrpWscTu21w/+/HGN8IjzeODBhLC8X3fj8JERLRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861782; c=relaxed/simple;
	bh=sEs1+3kv0SkL/kcWY1NDLycL1KPJmbmndgHyx4qL61g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZMKY0jnro02nNhtu8HCLXJH7evjXv7+r0PZu2JFKPMuGsBGwqOE/RMlzOj5+ADKOQ1gI5axy8D5EoCnhx6/EjRTbuSCeP8skCZZirVJqyQIxx6cgSwgf97+oOOyqShA/Hr/XIkNjWCi64AQWnU3pZbF9HhtMYRH700edX1dlILU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzB1zxkn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzB1zxkn"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso1444075e9.0
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 13:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787861778; x=1788466578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iXvKxCRwrOA7zm77R1LkD/sIJDTYXZSfnd5GgnuNsQ4=;
        b=bzB1zxknVUtP2CuBxGVrX72cK6cbH/viUI0W7h9zhGStWyXwHB199KwIQGyKim198z
         ax6vnw+rJB/JYJ+F4FfQKB46CU0SvuRDevmVpdaJVjal09mQOx16V19ctJ459Mq38KHf
         wuUvN7cGFumLOPBYaIINnTlxICPJ8hqGmqNiA9LeiP00m80yBKvI0Aghf4QpkXTJ0RvL
         aap7zALyzUYglJx1uWRJW2G0mKLN0KF6h0EMx/fpFwWRQtILdUXfT7deZM6qPs2zgvc+
         1cGCrF15MeGl8gTCQDgEHESFqTNbWVqYp94xdgQwPNVHdDpWh5bZWPjdL7kBI43wlGIC
         8PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787861778; x=1788466578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iXvKxCRwrOA7zm77R1LkD/sIJDTYXZSfnd5GgnuNsQ4=;
        b=gkDdTHVBmA6EcL2ZM5Mm58FMQlxlkY5ulTNTw972WKDO1ZjUEuzAWDLa1NrvyV3VWy
         608djBMtsLmXHUrutBTsq8X1HB5vIoobrvhCsMgxTOuLcaWC1EA8SyVRur6Yr8YRoF9n
         JElm5lvww9Ifl5Qp+xzDNQGF1OPGAk+NIEjJpyzhk0NOiCb78A3KC6OXBhVHwp27+pQj
         HoqdEG6ZLP+EEjasaRizKrieOPDxHvMwkNfl5XClS2Z5TLPf0tBRU1eykLtddejJEEHh
         4ypTRNBG9F4Bua0NEazznkjB7RazdUb09YUi7IPjVe4PM4pSpzeCBytqW4CZkCScDSNF
         R+Ug==
X-Forwarded-Encrypted: i=1; AHgh+Rru/iB8NAwkhMVsERdB9GUvJ9QKp1jb2WJDxfVMZJtr/kouZwXCzY/qUmYIQxA+TxuuBtl1vBxcGAQotA==@vger.kernel.org
X-Gm-Message-State: AFuF++liRp9KeSPMrlJaz9/PsNaER8h5SmfrdK71zOoagypl0N7SfleV
	Fp4APN3HPJJELdVOs43eC8TeHwDLWxb9FtWrIwd52ytI7vouV+smL8oU
X-Gm-Gg: AR+sD12oXZC8f8OwGQcfa02FeZKllnp98YzRaLuBVhg99IAg4LF0FMR0cxoflX9f1x9
	bAtNPDuenB1+zAgzzo5+K344ssPRT3aJ+MNTQGvL9A4hyyrpVwIhaBraPtVnRsfFWlUTegSwwHD
	lrNoJciqHcu283n5EOaWB2GmpEreM2kI8krGnQa79x+PTtNkENYlEoap1d9oQUOFyZksutSpIUy
	iiCPCjTFkoBJ/DtNpBCWt35AW/XqLLSuwYKlTLXGUz2UtxQ5KCyIaeyPQaqlzM4xUgHWzrQ5+3g
	2BcLfE1bZAn7RQklPyPRnq13EfYTal26bB8pnBpjYuSkBZ75zgOkRGwtSltYS4je6F3CgEYxNjD
	pgM37xNipKnn0yQxIqXrjfdrXxX4cSxxAARbRkw0BEWzV6YOOVXtrabyGZT9wjbxgwJTvNoEjEJ
	Ia11bn34i0aUFuj5H+rZvgsvDCidAkDe5FSR287BV+UN/x6X1Nd8vOK+h0
X-Received: by 2002:a05:600c:1d15:b0:499:d366:f572 with SMTP id 5b1f17b1804b1-49b91c4338cmr17257705e9.10.1787861778225;
        Thu, 27 Aug 2026 13:16:18 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:8824:7cb0:614c:86fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4961004bsm91899855e9.4.2026.08.27.13.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 13:16:17 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v9 0/6] Enable cameras on Dell Latitude 5285 2-in-1
Date: Thu, 27 Aug 2026 22:16:05 +0200
Message-ID: <20260827201611.99825-1-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables the front (OV5670/INT3479) and rear (OV8858/INT3477)
cameras on the Dell Latitude 5285 2-in-1 under Linux.

Per Documentation/process/coding-assistants.rst: this work was developed
with help from an AI coding assistant (Claude Code, by Anthropic). I used
it to help reverse-engineer the ACPI/TPS68470 bring-up, iterate on the
board data, and draft these patches; I have reviewed and tested all of it
on the hardware and take responsibility for the result.

The series is interdependent (all six patches are needed for working
cameras) and touches three subsystems: mfd (patch 1), platform/x86 int3472
(patches 2-4) and media (patches 5-6). It is probably best merged as one
set - for example via platform-drivers-x86 with an immutable branch that
the media and MFD trees can pull. Lee, an Acked-by on patch 1 (mfd) would
help enable that; I'm happy to follow whichever merge approach the
maintainers prefer.

Changes since v8 (addressing Andy Shevchenko's review):
- Patch 1: correct the subject prefix to "mfd:"; carry Andy's Reviewed-by.
- Patch 2: fold the reverse-xmas-tree reorder in with the unsigned int
  conversion, so it is no longer left over in patch 3.
- Patch 3: introduce a local "struct device *dev" and use it to shorten the
  board-data lines; return -ENODATA rather than -ENODEV when the board data
  is missing.
- Regenerated as a single coherent series (one tree, git format-patch
  --cover-letter) with a proper diffstat, and sent as a new thread.
  Apologies for the malformed v8 posting.

Earlier changelogs are in the v7 and v8 postings:
  v8: https://lore.kernel.org/all/20260826112452.13539-1-tchatard@gmail.com/
  v7: https://lore.kernel.org/all/20260819140107.1329091-1-tchatard@gmail.com/

Tested on Ubuntu 25.10 (kernel 6.17.0-22-generic) and Ubuntu 26.04 (kernel
7.0.0-30-generic): both cameras working in Zoom, Chrome, and GNOME Camera
via PipeWire. Also independently tested on the closely-related Dell Latitude
5290 2-in-1 (same IPU3/TPS68470/OV5670/OV8858/DW9714 stack) by Vitalii
Tytskyi:
  https://github.com/vitovt/dell-5290-camera-kernel/tree/master/patches

Thierry Chatard (6):
  mfd: intel-lpss: add resource conflict quirk for Dell Latitude 5285
  platform/x86: int3472: tps68470: use unsigned int for GPIO lookup loop
    counters
  platform/x86: int3472: tps68470: fix clock consumer registration for
    Dell Latitude 5285
  platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
  media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
  media: ov8858: add ACPI device ID INT3477

 drivers/media/i2c/ov8858.c                    |   7 +
 drivers/media/pci/intel/ipu-bridge.c          |   2 +
 drivers/mfd/intel-lpss-acpi.c                 |  32 ++++
 drivers/platform/x86/intel/int3472/tps68470.c | 109 ++++++-----
 drivers/platform/x86/intel/int3472/tps68470.h |  10 ++
 .../x86/intel/int3472/tps68470_board_data.c   | 170 +++++++++++++++++-
 6 files changed, 281 insertions(+), 49 deletions(-)


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.53.0

