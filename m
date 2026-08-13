Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071ED38BF7F
	for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 17:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642609; cv=none; b=LBwzwavLSOUjU2JjvwH1I8WzygfWlduoXeu2aKGVBhr3V4I5prDUMOfFOWrbg64wAEN8mMOXA88dGFvPkTEIbU/sLeq2EV/ib23Dd/3b/Uj4sMVDFfgGu3oJX8GJnYaLkWkjASDmCXE/prgCgB5j656w+z7p6hByYUMnIncwzJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642609; c=relaxed/simple;
	bh=vFO8T5St9bHRfShOkdntWHdgKTvr0mMlitt92RbLqMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l9PZe/HWyNw9k8swJPQbamBmtd7CLtyWDP6y13chsa9dE08U03Ch4aw3k91d3/YMNRBQqkqTOCWv7oVEbmD4cWbuezjHQRjrVzMtfuZDHT6znEyJXJMnYBHe2UxMzKBRNGgNPlXnP7LcZlVziSyxerJXUDayqPufSL2V975FL34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsARKkqS; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsARKkqS"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84874b52eabso15946b3a.0
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 10:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786642607; x=1787247407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4p9Nb8ebnBJPWlNwOosbnkR+LasQDJ4X2QwSqMP0inY=;
        b=XsARKkqSqd1BWPT/NINX3h8YppwGjyvr5vZ3FjQR5qPpavJUMZPCwylQ9g62IdyWkG
         gwFxd/uN27O8JsrOtaLZuAQ7cumW5ew0stYfESr+6aTzRCuvNi+WLUAbvNNS4Ap8gSTx
         cJYzOQcG7tRLsyGmqEhUu13/T4ORcV2I4AmtPSXlg6IZ+XMzeSVhuOZjL9CFIj9LI8dS
         qO/RMydYmk5CRGxkjlfkVNZYUgsbtXz/tQt/5AMBzp3L447kWzLJ7YPQ2pgw32A6EjUa
         E7xqCb3DQu+jWz7CWiSNTsms0JZdv5U9cvAggoAUaJsFjrImfXhiU3vnzBwuuTqEzMQ2
         RDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786642607; x=1787247407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4p9Nb8ebnBJPWlNwOosbnkR+LasQDJ4X2QwSqMP0inY=;
        b=of3P8puoNLRiKFqV89FN4pmtCLXY8HMQc8W51Tz1Jc1FkH6ojTiMd8i1yWNZQKGd6A
         rz/NZAmoKljRin+QabRkvVmTFI72kuKtxg2pSzW0Vj48mGKZdwilD/byDmsSI3KzqXuL
         mUQ0Rd7XvIMvHFb2LikCXaDSUd9CtTA5SFI0K9AheB1ePqq8NI3Z9SLmL3VGPBZFHPzw
         HTO3wg5J66TcEAVYmbTTORRw8zWBcF3QlLxsH0cB7u3mqmCS9fd24Tm+HYXlMZMR0j2h
         6eI9pX1YD1RbeKgIhaxM8hObc/mlf38SJWvN1Y+iUg0VZihYO+Gg5hi2ZAvksBTVlzmv
         N5SQ==
X-Gm-Message-State: AOJu0YzaBpbLkmFmMI2IDlu39q5RKA6HN3aewuLTRqbEo2rAL5D34adY
	VT530hMYjdrCL53AZW4YnWwhB4ebL9Gf1rb/Jh8RhluJd03hxrzVi++TO4KfpHhV/MM=
X-Gm-Gg: AR+sD12Ijt1buA+UB8Ynf8HYb1RXtV1xCDskxZNijeXFx+7sJbnM8M3Kqumd9G1uPPz
	4aaTNV5dT7KxW09oVrjyWM25/QXGDExgMJlVf/XvyO6mEXunkM0XHAGVtWYD7cMlHjcQj/CGHZn
	9eN27RtYUsSvJ9gCYoaf/Jk47HPGc1kb1CJR34KBaH/dtIsfrDkhi4Ua+4qTeLr3+N6zgUpBkDH
	MSmIurw30RAm9qUJ5CvkWk42bF9hmwgfoRD9zxAXBwGR0UWbw3Tmvp3DcLl4QWrPzlTXcR+diCa
	WgQxPmiEGPa88LqVp1k6fwCLtT2jLNFiRFxsoTFYRMdx8T3YEQM46zkuUMFWIkNjnuLvR++QAQ3
	jkAKTfPyaG5xNmliIwZA36H805pkSFhf77XcNvWxskvJ8hK9I9FIF9EhsLm6fRmdab4C0Wg9ylt
	Vt7pr1XonTO59+LY4lMKwVt9imwB77dnn34CClahv+ZS0sVFEtJTQALeWJ/p4fk5k9vhH0WAJ5W
	a/d+m7QI2WG9zvDrQC3ZvqjiLGwdrt/5V5tGR5db1Zu2V0xKVTrqc5bxLN1iWrmv3Q=
X-Received: by 2002:a05:6a00:410a:b0:845:cd11:37e8 with SMTP id d2e1a72fcca58-84fc6dc6b5bmr8664947b3a.24.1786642606723;
        Thu, 13 Aug 2026 10:36:46 -0700 (PDT)
Received: from desktop.local (97-115-114-204.ptld.qwest.net. [97.115.114.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc4565c86sm1269994b3a.12.2026.08.13.10.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:36:46 -0700 (PDT)
From: Jack Flusche <jackflusche@gmail.com>
To: linux-media@vger.kernel.org
Cc: Jack Flusche <jackflusche@gmail.com>,
	patrik.r.jakobsson@gmail.com,
	sakari.ailus@linux.intel.com,
	hverkuil@kernel.org
Subject: [PATCH 4/5] facetimehd: add firmware extraction script from patjak/facetimehd-firmware
Date: Thu, 13 Aug 2026 10:35:12 -0700
Message-ID: <20260813173516.29293-5-jackflusche@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813173516.29293-1-jackflusche@gmail.com>
References: <20260813173516.29293-1-jackflusche@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Copy script from https://github.com/patjak/facetimehd-firmware to
extract proprietary firmware for the FacetimeHD driver from an
Apple OSX update file and add a FIRMWARE file to describe usage

Signed-off-by: Jack Flusche <jackflusche@gmail.com>
---
 drivers/media/pci/facetimehd/FIRMWARE    |  6 +++
 drivers/media/pci/facetimehd/firmware.sh | 61 ++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 drivers/media/pci/facetimehd/FIRMWARE
 create mode 100755 drivers/media/pci/facetimehd/firmware.sh

diff --git a/drivers/media/pci/facetimehd/FIRMWARE b/drivers/media/pci/facetimehd/FIRMWARE
new file mode 100644
index 000000000000..ba9f37aa702f
--- /dev/null
+++ b/drivers/media/pci/facetimehd/FIRMWARE
@@ -0,0 +1,6 @@
+This driver uses proprietary Apple firmware. To obtain this firmware, use the
+included firmware.sh script (copied from patjak/facetimehd-firmware). This
+script will download and extract the firmware from a Mac update file found at
+https://updates.cdn-apple.com/2019/cert/041-88431-20191011-e7ee7d98-2878-4cd9-bc0a-d98b3a1e24b1/OSXUpd10.11.5.dmg
+The script extracts the firmware to /usr/lib/firmware or /lib/firmware,
+or to a folder specified using the first argument
\ No newline at end of file
diff --git a/drivers/media/pci/facetimehd/firmware.sh b/drivers/media/pci/facetimehd/firmware.sh
new file mode 100755
index 000000000000..fc6b67149390
--- /dev/null
+++ b/drivers/media/pci/facetimehd/firmware.sh
@@ -0,0 +1,61 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-only
+
+# This is a simplified version of the download/extract/install scripts
+# It is intended to be used by disto package installs (e.g. in %post stage)
+
+URL=https://updates.cdn-apple.com/2019/cert/041-88431-20191011-e7ee7d98-2878-4cd9-bc0a-d98b3a1e24b1/OSXUpd10.11.5.dmg
+RANGE=204909802-207733123
+OSX_DRV=AppleCameraInterface
+OSX_DRV_DIR=System/Library/Extensions/AppleCameraInterface.kext/Contents/MacOS
+FILE=$OSX_DRV_DIR/$OSX_DRV
+DRV_HASH=f56e68a880b65767335071531a1c75f3cfd4958adc6d871adf8dbf3b788e8ee1
+FW_HASH=e3e6034a67dfdaa27672dd547698bbc5b33f47f1fc7f5572a2fb68ea09d32d3d
+OFFSET=81920
+SIZE=603715
+
+if [[ "$EUID" != 0 ]]
+	then echo "Please run as root"
+	exit 1
+fi
+
+echo -e "FacetimeHD firmware download and installation script\n"
+
+echo -n "Downloading driver..."
+cd /tmp
+curl -s -L -r "$RANGE" "$URL" | xzcat -q  2> /dev/null | \
+	cpio --format odc -i -d "./$FILE" &> /dev/null
+mv $FILE .
+rm -R ./System
+echo "done"
+
+HASH=$(sha256sum $OSX_DRV | awk '{ print $1 }')
+if [[ "$HASH" != "$DRV_HASH" ]]; then
+	echo "Incorrect driver checksum. Aborting."
+	exit 1
+fi
+
+echo -n "Extracting firmware..."
+dd bs=1 skip=$OFFSET count=$SIZE if=./$OSX_DRV of=./firmware.bin.gz &> /dev/null
+rm ./$OSX_DRV
+gunzip ./firmware.bin.gz
+echo "done"
+HASH=$(sha256sum ./firmware.bin | awk '{ print $1 }')
+if [[ "$HASH" != "$FW_HASH" ]]; then
+	echo "Incorrect firmware checksum. Aborting."
+	exit 1
+fi
+
+echo -n "Installing firmware..."
+if [ -n "$1" ]; then
+    FW_DIR=$1
+elif [ -d "/usr/lib/firmware" ]; then
+	FW_DIR=/usr/lib/firmware/facetimehd
+else
+	FW_DIR=/lib/firmware/facetimehd
+fi
+
+install -dm755 $FW_DIR
+install -m644 firmware.bin $FW_DIR/firmware.bin
+rm firmware.bin
+echo "done"
-- 
2.55.0

