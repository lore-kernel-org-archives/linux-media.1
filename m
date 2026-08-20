Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D624391E7E
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 18:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787250135; cv=none; b=GulDhFImW2rsh1cTRUtyfk0f4k7l2iLNYczKn0RK1PkNUghnzOUzLapdVm+ZuH/OaSJK8uMgtO2tG317qXrw4kCqCKw4twcRcTZNaZOIo49ErRcCdkoDB4BO1VO8cbUh2QBGoR1lKcmiKN9FwYTEIBj6cdks8xF3hDWJGINR9X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787250135; c=relaxed/simple;
	bh=vFO8T5St9bHRfShOkdntWHdgKTvr0mMlitt92RbLqMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rvFZA85ascJKNlFjy6lTecyLnmq9a5g4689nDKM/9JC+TQ9QD0WM6RMZyx7+BCd6oAj5tVqM9KSdFgWxQPn1HBGsdGflus+v7K8VmTpBsskSE3syVOGRaKI3y4lzbn/FPgTrmHaIuPqiokaAftyVBMX6cdZswucAUOUZY33p4Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3nNNieI; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3nNNieI"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso133511b3a.1
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 11:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787250133; x=1787854933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4p9Nb8ebnBJPWlNwOosbnkR+LasQDJ4X2QwSqMP0inY=;
        b=j3nNNieI6K4yEhT1NSKudTuUjMfXlEAOW3lc++p5WRzz2WUc1lR7UMys/0Ir2Vjtxm
         evLPKGkrejZTOebcAPbF6Om5GJ3feshMBfBlrBUU2mkTrrTJySygaHKreuRQc1GwmM62
         p1NPyTM0BruyOs76k4jHQP/oYxHyEJMPReXV4/ZbHC85HYJB9M3RpsWY+RlTBI9/jOmZ
         E2ih9LYy7xqoJ/mYKZd1kOOBVMG2vnO5VDOib8I7Wx8E/zEQf1LhV606hjUIMGmTE7xL
         3PzJJ2649NraaB2wHFtndXH4Nftq0tKjw14aUvJ+D05EbF5JVviWW5MiXkC9SpiAx0+o
         bVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787250133; x=1787854933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4p9Nb8ebnBJPWlNwOosbnkR+LasQDJ4X2QwSqMP0inY=;
        b=GuUtoXVM1ZRqqmljNGy8r1txnBznOxsIG0UJH21N1ilRzXHUiNoIxUmWkQfDd0BLJQ
         jzZ0fLwONtiEhXUezTOx5D5fmSSLhP6exImDk35uFN2sAr41y4u5rWqr5E1ZL39iaq3w
         rq44SENXn9RsWZj1imnnkvgAmsRhEJGcbxBe8PgChTywoetIWJDq5Fst+WxRVroTorRH
         o5YcS0FCwdtGQCzgrisDOG/mM9S75dETkcJyQXcDK7CN4DCYljTxzJ2dwGwKGhQ39R3P
         d8p/FB6nGGLYIW2jI/+9siFPLkGSRs+HA0YnxwELzu4G+APRIOmfTIRQhfaNxfVP6akT
         MqMQ==
X-Gm-Message-State: AOJu0Yy7QdFcUG620L8fCxfNfa9eaWQlYvdS061yWwLiLhc0Ww5dfYta
	yokSSV+wpjDVQA6R02DntIa5LLRg1Dq1Z4r/lJ0QdH6QP2py3NRT+fsiQArg/Oy4t9E=
X-Gm-Gg: AR+sD13QvcQ0uJxTQqwRNroLIr7K24JOlkICgNBoQxYiawQli8RUD0Pc/LX6GA7ZMwe
	NxYgG8KOPCMWCw52qF/s6iHmIfWA8glpYznw3dQz//ovyoi/6pMX9X6ktNkXetZSDlKHMmZFQPA
	ckZpmK5PX9NbmOuOX0ohxYbR0eEr3t64CzWhT6To/Tt8CYahp5APgkLNOOOwViF6NpmUu+APn8K
	cbFAMSx33sCAEi7rucaRB4RI3olF8XCy6TW3fo7x5YamRadu5bj/wFB1GE2HiuI3WfoODBCzXtG
	JFBjMMk6A52Fi5GhBlIih0FjmWALd7xjNW6THzm2W2vb4uvGCNfbnsDtux2bmoYbfXxmcZMD8gu
	wY8JiQevPSSqr12ALEcFkgS1VqQMP4Kw+Vq32PQ28PobEwVLZ+nQyPr/kr4BewLrbYvvIiamJOE
	cMnmYd3CyeKapQlARwFz906LfwY8ikxY5Tan+IzWbRnKT/PSCkgoBJwjLq3AniHRrS9D7EC45XP
	qkwBwTSlgli266lqHhJmUBXGkesZdWwTeJF0hEJOsXu20HB2mvkaw==
X-Received: by 2002:a05:6a00:4c84:b0:851:b03a:fcb with SMTP id d2e1a72fcca58-851d39405c0mr26924904b3a.14.1787250133099;
        Thu, 20 Aug 2026 11:22:13 -0700 (PDT)
Received: from desktop.local (97-115-106-59.ptld.qwest.net. [97.115.106.59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d369a487sm2037829b3a.59.2026.08.20.11.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:22:12 -0700 (PDT)
From: Jack Flusche <jackflusche@gmail.com>
To: linux-media@vger.kernel.org
Cc: Jack Flusche <jackflusche@gmail.com>,
	patrik.r.jakobsson@gmail.com,
	sakari.ailus@linux.intel.com,
	hverkuil@kernel.org
Subject: [RESEND PATCH 4/5] facetimehd: add firmware extraction script from patjak/facetimehd-firmware
Date: Thu, 20 Aug 2026 11:21:53 -0700
Message-ID: <20260820182156.18078-5-jackflusche@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820182156.18078-1-jackflusche@gmail.com>
References: <20260820182156.18078-1-jackflusche@gmail.com>
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

