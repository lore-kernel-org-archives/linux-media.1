Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023074.outbound.protection.outlook.com [40.93.201.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023543BB12B;
	Thu, 30 Jul 2026 07:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785396393; cv=fail; b=q2DpxAfgPEWR7yvH3RtSKCm0ssxBhi7Zv45l+pm+YH8W8Wq940UGMB157pVCA34uOFa4JXNP03mSxvuSsRAH13agiYy3RpeX+Iuy3ksA2ppwDY0v7I4u2JQVhSO5d7bx6KBg9Adre8ho6clox8hBbukN/teUYWdS8dWJtcCm2Nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785396393; c=relaxed/simple;
	bh=uN4CpnWqWpSsOV7mISPq29Rgn/vx0aY3hvgkmSRCj5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tsd3toXbCH8yaiB8CJBhAjfQZbqbcsv0nCPzj10Nexx40DUFRHUNdf2g2wr+xNN+eD6Klk9cpX7G3glU8IYz5c/iIIdPthwqJA/Hb4ZyFQr890KLIgmToNP0wd6Y+lRv0wisx9BsHTivAk+QIPYK2aYkDE2lJ3VLmIVbNQ83xBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=J0eXtXGV; arc=fail smtp.client-ip=40.93.201.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="J0eXtXGV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdwxZbbKY0JVsRh5mhrZM9BLK29Qed+fuB/mEbJfChwjFxuUf/baFXFirA5kyNG7pE0ONT8ZIuSHrSFb+djNu3l7XweyGJlLbmmXPCYuvw5uHXReQudMmHlbXgwA+iSqx0qpvqA1YBhHro3Unm6I64C4NlEtM2DXCsYVbmFLIrLxa3IJgJjY3ehZhZ40Qm56KUFN7EmVdjGZ1SGJlPxqqOMIcPu+EGQECrj29hafzs6TkVgQu+6By+otRpITTD/zUzG8pU6GixUHwAbnjRNKc/J4syBuKAGwwPlgE3SRnZcXQ02mdWfiWf8KwuOIurWSQtM3Z+/K4nYT6fcCET8l9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTIgU36LIq29iHl0hsG3kL+G/AKXn5l14S3Smd8svcI=;
 b=tzePcNw8hla2vz9mravqL3V2VYXFEkxhTV7Pdn6Dh92OkawE11ueSxcJhdY719YFuArKN4D1QqrUe9QyDlG8ZSGUy0pg9PRmg1xF652prLuNzwFg9cx0pdgfu48p3x6GyQcTdWC+gSDCfwclj4jAXks+oc1fmbnvIZypXgF8QK+foHaQBL1xajM4GscvtvPatI5jytp7fQw+pv3xvk9rqo6P4ii8RhhPiR2JIhgD4x5bNcyv8FskH7TmS7gpMfq8HQlTYgf+LLLnhDDiOPoNDFhbYir0FsgoJuYPoGQaqc6Gyjk8kCPORED/3/Hge9G5KD49JJrRJpRPCKCcMfwUUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTIgU36LIq29iHl0hsG3kL+G/AKXn5l14S3Smd8svcI=;
 b=J0eXtXGVv9c4f7IEMyk99YIWwPtD1AVq2wOCZAgWXWplKnBopD/GzeHHJ5GW/6f2S5c2B3GCDv9/pbELPRP/fFwShUBiSdyYRzvCnWqU9jVAeveRt69cgx7If0KrF7pESrXy91sGyaWz0DwkK/DhpjAvcvlDu58TaLmyljThU6Po1x0QLMgeiecqjb93OHy+24Y//djeedklZL0bxFQCp8m9Cbo4eZ3jVuKFaU3ECFRI2CgY+Zxcn3vydXBdGrbXGuUde7lHaRG06Zpu/Qu3yaDUJ1CHWIf6C+tuVJvbOd42ecARGzyMR7dD2hLzQUzvkXhHXweL9UEPWY3FcZcvag==
Received: from BL1PR13CA0264.namprd13.prod.outlook.com (2603:10b6:208:2ba::29)
 by SA0PR18MB3568.namprd18.prod.outlook.com (2603:10b6:806:95::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 07:26:24 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:2ba:cafe::53) by BL1PR13CA0264.outlook.office365.com
 (2603:10b6:208:2ba::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8 via Frontend Transport; Thu, 30
 Jul 2026 07:26:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 07:26:23 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id AEE534186B5D;
	Thu, 30 Jul 2026 00:26:22 -0700 (PDT)
From: Tzu-Hao Wei <twei@axiado.com>
Date: Thu, 30 Jul 2026 15:26:09 +0800
Subject: [PATCH 2/2] media: axiado: add V4L2 capture driver for
 AX3000/AX3005 SoC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-ax3000-display-driver-v1-2-4fbd4d0c85d3@axiado.com>
References: <20260730-ax3000-display-driver-v1-0-4fbd4d0c85d3@axiado.com>
In-Reply-To: <20260730-ax3000-display-driver-v1-0-4fbd4d0c85d3@axiado.com>
To: Shubhangini G <shubhangini@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=32969; i=twei@axiado.com;
 h=from:subject:message-id; bh=uN4CpnWqWpSsOV7mISPq29Rgn/vx0aY3hvgkmSRCj5Y=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBqavye59C2sAuAATs/M2FTHIKDCWncZrY9f9hKL
 SuURIIwrWiJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCamr8ngAKCRB4EDBdxFrx
 1/msC/wMCZL+pWkC0HfDOdeYwxJFJXeoYIgjxkA9jRg2YKRaDdEDdG5FrmgQLpjJbfMJsKmUvwY
 KNp11FIz2U+tYU7t8NbLnhhKs9ae2CAYNN36DZSo++aPTeA50xQm1AsFZND+SbVhd3SUxGidZMH
 mSih5feXMt7cxwtssMBkj1up5Vt618j7trhTkkI+JWGWLK8EuUblywgCqnZropOGDDfHSNV/sJC
 1ZvjgskavEga7UPb+SuC23hAEbznz3YgMs2EnC1ufinYwctcWRbNPuIaVoeLQwzgtOBPH2YQ1Zd
 BzBzrtjaHQJ0CV3OtJ3hjvd/1LmSo9Bg9keicX/JE1HVZi3f8nHyxmpXPWYXY2hjcCtMbls3oOw
 Oep0W0R9AQDaeJTv6sPkdHK23k9rAFOgquBxHkGT0fdBWWGd4sUHToOb4sVCVjQzYDl/N19BaqK
 83s0CF3x3qbDTZ/YvNnhAdLvCNXw+wfsv5CNsCKVa0BfflUJ8tkwuUoZtqK547/1ppIoE=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|SA0PR18MB3568:EE_
X-MS-Office365-Filtering-Correlation-Id: 704b86f6-af90-4a81-5585-08deee0bdc13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|42112799006|82310400026|36860700016|10067099003|6133799003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	UvEPQc789z41ZfzCybMmWoZeThp47hgZy5FnBhZcc77tvFN+lxEfom/7GbsAhfo+wCaawvvjFWC09aymOXs1Z5nPXFsg5GmkncdtRLWa7sWaAj92gPk3wNyiC7zqn87lqhWtcJWzWVyA1+ajjNdum2kNhtXWWPe1GLyOI0MfiL9Yb5EzdK5eE3eKVbF3C+f0czA7DETvWPYskv9tOAuMzTUur5YlKN2r4M1eNNTXi4KLg46kDxJn9Qz25m+wdqHkT3OTGG9fRHkZCiogxEeMHMifQ1aMPSmIAvva3UaLp1Umj5UbDmqrZN9Yl7wsQmQrdv5bvaL3YrLNbiIgOsB13GMdxYLtLp1dyGsGnBInzs0ZuOh3o3WqihtSTgLx2D0RfkLgJPHTsLmxSDH+lyY91DW+sIvC/4n/KStm0gkmkYivsxnr0+kNeUFHr13L8bQ5Vb+mJdgk0V4irzVp81KoB9r0KS2n00/qkf/3O2TTkMT2xRqiDHjNWgec+AZ11F5LodoHkWsqsYF25aC0fpd827fK1T3ocF6hL5cPRGlBzURWq4zHpfor6dYTZJxVq0poZWwQrSfW8yNwbICJXR2L8lrHI/2dHHNGOkW7ektFH+0Kt2S/6n60eYh9h9gi3v0EjSeoHItqfRhFHA6OVXrqZ/tVZzRslq2+xCWl+rgiB9Ej0HPesJCkuw/oJk9VMd4l6BUGLiu+1BhgJh1KpWXQ3w==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(42112799006)(82310400026)(36860700016)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/WO7rbC1RZqwmkqBjZAwPJcIFShXbkG42TRe4CaIrCk0IHdqMIaz8aQwMb3s2G6tdbZnXSEMRLCLs/hKaOYwOM56zV57++2354b0h5tHAF4llURP98UmD+dg/T6wvbPwvREgbLml2O2wvK6q+Rfty5z+2soYpv/fG3aWAEonvrXR81lO8BALvo8jHKWS7rtQA5pA315EScPaMIqdE0Ao0LKFbk1mE1vuwi6hxCJOd4Zxk4fzCwNJeHd9le0ETstCieYFiZ51DTaPJSb3vbOC8JvjCZb5kYq9Rh7U7EuI9uA2NLgoruuMeCV9tRIMKK9rqrESCY/beFjOBS2p+CG1vIgSM+/HNPHO/p5fRP1pqUSMSTZ+x656cPKy4BzDD65y7QO4yAxLRTRzpk1g6l9o9CqxNOA94Fy5lP8/IvCYxvpaUddthbhAssodogyEi5Do
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 07:26:23.5758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 704b86f6-af90-4a81-5585-08deee0bdc13
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR18MB3568

The Axiado AX3000 and AX3005 SoCs expose a display capture path that
delivers frames into a shared reserved memory region and exposes them
as a standard V4L2 capture device via the videobuf2 framework.

There is no local register interface for this driver to program: frame
delivery is controlled entirely by the host-side display engine and
the PCIe endpoint mapping that feeds the shared region, both external
to this driver. A software polling timer schedules a workqueue item at
the configured framerate, which copies frames from the WC-mapped
shared region into vmalloc-backed vb2 buffers. Running the copy in a
work item rather than directly in the timer callback keeps potentially
multi-megabyte memcpy and per-pixel conversion work out of softirq
context.

Buffers are vmalloc-backed to avoid the buddy allocator MAX_ORDER
limit at full-HD resolution (1920x1080x4 = 8 MB per buffer). No DMA
engine is involved.

Three pixel formats are supported:

  XBGR32 - native source layout, copied directly
  RGB24  - XBGR32 byte-swapped on capture (B(0),G(1),R(2),X(3) to
           R(0),G(1),B(2)) per the V4L2 pixelformat spec
  YUYV   - BT.601 studio-swing YCbCr conversion (4:2:2 packed) from
           the XBGR32 source

S_FMT validates that the shared region is large enough for the 4-bpp
XBGR32 source read when RGB24 or YUYV is selected, not just the
smaller output size.  Probe fails hard if the shared region is smaller
than the default 640x480 XBGR32 frame so that streaming without S_FMT
never delivers silently truncated frames.

ENUM_DV_TIMINGS returns -EINVAL (no predefined fixed timings) and
DV_TIMINGS_CAP reports the supported width/height bounds, allowing
clients to discover capabilities before calling S_DV_TIMINGS.

struct axiado_video is allocated with kzalloc and its lifetime is
managed via v4l2_device.release, which fires after the last open file
descriptor is closed following device unregistration.  This prevents a
use-after-free when the platform device is unbound while /dev/videoN
is still open.

S_PARM is guarded by vb2_is_busy() to reject framerate changes while
buffers are allocated.  fps and frame_interval are accessed with
WRITE_ONCE/READ_ONCE to avoid data races with the capture workqueue.

PM suspend stops the capture timer and drains the workqueue; PM resume
restarts them if streaming was active, using vb2_is_streaming() as the
authoritative source of streaming state.

When present, the second memory-region entry maps a host-written
control mailbox. axiado_video_detect_timings() reads the width/height
the host is currently driving from it for QUERY_DV_TIMINGS, falling
back to the configured capture format if the mailbox is unmapped,
unwritten, or reports an out-of-range size.

Co-developed-by: Shubhangini G <shubhangini@axiado.com>
Signed-off-by: Shubhangini G <shubhangini@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 MAINTAINERS                                  |   1 +
 drivers/media/platform/Kconfig               |   1 +
 drivers/media/platform/Makefile              |   1 +
 drivers/media/platform/axiado/Kconfig        |  17 +
 drivers/media/platform/axiado/Makefile       |   2 +
 drivers/media/platform/axiado/axiado-video.c | 850 +++++++++++++++++++++++++++
 6 files changed, 872 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 16e3acc3b870949e6d78bfbf337b78a73f2cddd7..1011e0720fce9b0f81c4716d3f180c17d3509b91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4434,6 +4434,7 @@ M:	Prasad Bolisetty <pbolisetty@axiado.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/media/axiado,ax3000-video.yaml
+F:	drivers/media/platform/axiado/
 
 AXIADO EMMC PHY DRIVER
 M:	SriNavmani A <srinavmani@axiado.com>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 0b33e927bd59cbedd3cb59633f706f98105b76cf..e99f0fa88cb596bb9814ce9040f778ce76eb202a 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -69,6 +69,7 @@ source "drivers/media/platform/amphion/Kconfig"
 source "drivers/media/platform/arm/Kconfig"
 source "drivers/media/platform/aspeed/Kconfig"
 source "drivers/media/platform/atmel/Kconfig"
+source "drivers/media/platform/axiado/Kconfig"
 source "drivers/media/platform/broadcom/Kconfig"
 source "drivers/media/platform/cadence/Kconfig"
 source "drivers/media/platform/chips-media/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 16c185752474e598f4c0627ddf1c016b3b1e2f53..282bde29f6782369c4b39f083ad0759408637ba9 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -12,6 +12,7 @@ obj-y += amphion/
 obj-y += arm/
 obj-y += aspeed/
 obj-y += atmel/
+obj-y += axiado/
 obj-y += broadcom/
 obj-y += cadence/
 obj-y += chips-media/
diff --git a/drivers/media/platform/axiado/Kconfig b/drivers/media/platform/axiado/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..8b7e9a4b79da214d2778b756c9abd1bee5d612a5
--- /dev/null
+++ b/drivers/media/platform/axiado/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+comment "Axiado media platform drivers"
+
+config VIDEO_AXIADO
+	tristate "Axiado AX3000 video capture driver"
+	depends on ARCH_AXIADO || COMPILE_TEST
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_DEV
+	select VIDEOBUF2_VMALLOC
+	help
+	  V4L2 capture driver for the Axiado AX3000 SoC display capture
+	  controller. The controller has no MMIO registers; frames written
+	  by the display engine into a reserved memory region are exposed
+	  as a V4L2 capture device.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called axiado-video.
diff --git a/drivers/media/platform/axiado/Makefile b/drivers/media/platform/axiado/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..aa73205c8c3ec83da86bc62eebb8e6b561a45043
--- /dev/null
+++ b/drivers/media/platform/axiado/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_VIDEO_AXIADO) += axiado-video.o
diff --git a/drivers/media/platform/axiado/axiado-video.c b/drivers/media/platform/axiado/axiado-video.c
new file mode 100644
index 0000000000000000000000000000000000000000..f8962bdfe84dcf8096c2672b86f4ea7c282e1cad
--- /dev/null
+++ b/drivers/media/platform/axiado/axiado-video.c
@@ -0,0 +1,850 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023-2026 Axiado Corporation.
+ *
+ * Axiado AX3000 V4L2 capture driver.
+ */
+
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/timer.h>
+#include <linux/workqueue.h>
+
+#include <media/v4l2-device.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-vmalloc.h>
+
+#define AXIADO_VIDEO_DRIVER_NAME	"axiado-video"
+#define AXIADO_VIDEO_CARD_NAME		"Axiado AX3000 Video"
+
+#define AXIADO_VIDEO_MIN_WIDTH		320
+#define AXIADO_VIDEO_MIN_HEIGHT		240
+#define AXIADO_VIDEO_MAX_WIDTH		1920
+#define AXIADO_VIDEO_MAX_HEIGHT		1080
+#define AXIADO_VIDEO_DEF_WIDTH		640
+#define AXIADO_VIDEO_DEF_HEIGHT		480
+#define AXIADO_VIDEO_DEF_FRAMERATE	30
+#define AXIADO_VIDEO_MIN_BUFFERS	2
+
+/*
+ * Host-written current mode (u32 LE width, u32 LE height) in the control
+ * mailbox; must match AX_DP_MODE_DATA in the host's ax_drv.h.
+ */
+#define AX_DP_MODE_DATA		0x1000
+
+struct axiado_video_buffer {
+	struct vb2_v4l2_buffer	vb;
+	struct list_head	link;
+};
+
+static inline struct axiado_video_buffer *
+to_axiado_video_buffer(struct vb2_v4l2_buffer *vbuf)
+{
+	return container_of(vbuf, struct axiado_video_buffer, vb);
+}
+
+struct axiado_video {
+	struct device		*dev;
+	void			*addr;		/* memremap of shared region */
+	size_t			addr_size;	/* bytes mapped */
+	void __iomem		*ctrl_reg;	/* optional host control mailbox */
+
+	struct v4l2_device	v4l2_dev;
+	struct video_device	vdev;
+	struct vb2_queue	queue;
+	struct mutex		video_lock;	/* serialises queue + ioctls */
+
+	spinlock_t		buf_lock;	/* protects pending list */
+	struct list_head	pending;
+
+	struct timer_list	timer;
+	struct work_struct	capture_work;
+
+	struct v4l2_pix_format	pix_fmt;
+	unsigned int		frame_interval; /* jiffies between frames */
+	unsigned int		fps;
+
+	u32			sequence;
+	bool			streaming;
+};
+
+struct axiado_video_format {
+	u32	fourcc;
+	u8	bpp;
+};
+
+static const struct axiado_video_format axiado_video_formats[] = {
+	{ V4L2_PIX_FMT_XBGR32, 4 },
+	{ V4L2_PIX_FMT_RGB24,  3 },
+	{ V4L2_PIX_FMT_YUYV,   2 },
+};
+
+static const struct axiado_video_format *
+axiado_video_lookup_format(u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(axiado_video_formats); i++)
+		if (axiado_video_formats[i].fourcc == fourcc)
+			return &axiado_video_formats[i];
+	return NULL;
+}
+
+static void axiado_video_apply_format(struct v4l2_pix_format *p,
+				     const struct axiado_video_format *fmt)
+{
+	p->pixelformat = fmt->fourcc;
+	p->bytesperline = p->width * fmt->bpp;
+	p->sizeimage = p->bytesperline * p->height;
+	p->field = V4L2_FIELD_NONE;
+	p->colorspace = V4L2_COLORSPACE_SRGB;
+}
+
+static void axiado_video_clamp_size(struct v4l2_pix_format *p)
+{
+	p->width = clamp_t(u32, p->width & ~1u,
+			   AXIADO_VIDEO_MIN_WIDTH, AXIADO_VIDEO_MAX_WIDTH);
+	p->height = clamp_t(u32, p->height & ~1u,
+			    AXIADO_VIDEO_MIN_HEIGHT, AXIADO_VIDEO_MAX_HEIGHT);
+}
+
+static void axiado_video_capture_one(struct axiado_video *video)
+{
+	struct axiado_video_buffer *buf;
+	struct vb2_v4l2_buffer *vbuf;
+	unsigned long flags;
+	size_t copy_sz;
+	void *vaddr;
+
+	spin_lock_irqsave(&video->buf_lock, flags);
+	if (!READ_ONCE(video->streaming) || list_empty(&video->pending)) {
+		spin_unlock_irqrestore(&video->buf_lock, flags);
+		return;
+	}
+	buf = list_first_entry(&video->pending, struct axiado_video_buffer, link);
+	list_del_init(&buf->link);
+	spin_unlock_irqrestore(&video->buf_lock, flags);
+
+	vbuf = &buf->vb;
+	vaddr = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
+
+	if (vaddr) {
+		/*
+		 * Prevent the CPU from reordering the loads below against
+		 * prior loads.  This does not coordinate with the display
+		 * engine writer; a torn frame is possible if the poll timer
+		 * fires while the producer is mid-update.
+		 */
+		rmb();
+
+		if (video->pix_fmt.pixelformat == V4L2_PIX_FMT_RGB24) {
+			/*
+			 * XBGR32 memory order: B(0), G(1), R(2), X(3).
+			 * RGB24  memory order: R(0), G(1), B(2).
+			 */
+			const u8 *src = (const u8 *)video->addr;
+			u8 *dst = (u8 *)vaddr;
+			unsigned int pixels = video->pix_fmt.width * video->pix_fmt.height;
+			unsigned int i;
+
+			for (i = 0; i < pixels; i++) {
+				dst[i * 3 + 0] = src[i * 4 + 2]; /* R */
+				dst[i * 3 + 1] = src[i * 4 + 1]; /* G */
+				dst[i * 3 + 2] = src[i * 4 + 0]; /* B */
+			}
+
+			copy_sz = pixels * 3;
+			vb2_set_plane_payload(&vbuf->vb2_buf, 0, copy_sz);
+		} else if (video->pix_fmt.pixelformat == V4L2_PIX_FMT_YUYV) {
+			/*
+			 * BT.601 studio-swing XBGR32→YUYV (4:2:2 packed).
+			 * Source: B(0), G(1), R(2), X(3) per pixel.
+			 * Output: Y0, U, Y1, V per pair of pixels.
+			 * Width is always even (clamped in try_fmt).
+			 */
+			const u8 *src = (const u8 *)video->addr;
+			u8 *dst = (u8 *)vaddr;
+			unsigned int pairs = (video->pix_fmt.width * video->pix_fmt.height) / 2;
+			unsigned int i;
+
+			for (i = 0; i < pairs; i++) {
+				s32 b0 = src[i * 8 + 0], g0 = src[i * 8 + 1], r0 = src[i * 8 + 2];
+				s32 b1 = src[i * 8 + 4], g1 = src[i * 8 + 5], r1 = src[i * 8 + 6];
+
+				dst[i * 4 + 0] = ((66 * r0 + 129 * g0 +  25 * b0 + 128) >> 8) + 16;
+				dst[i * 4 + 1] = ((-38 * r0 - 74 * g0 + 112 * b0 + 128) >> 8) + 128;
+				dst[i * 4 + 2] = ((66 * r1 + 129 * g1 +  25 * b1 + 128) >> 8) + 16;
+				dst[i * 4 + 3] = ((112 * r0 - 94 * g0 - 18 * b0 + 128) >> 8) + 128;
+			}
+
+			copy_sz = video->pix_fmt.width * video->pix_fmt.height * 2;
+			vb2_set_plane_payload(&vbuf->vb2_buf, 0, copy_sz);
+		} else {
+			copy_sz = min_t(size_t, video->pix_fmt.sizeimage, video->addr_size);
+			memcpy(vaddr, video->addr, copy_sz);
+			vb2_set_plane_payload(&vbuf->vb2_buf, 0, copy_sz);
+		}
+	}
+
+	vbuf->vb2_buf.timestamp = ktime_get_ns();
+	vbuf->sequence = video->sequence++;
+	vbuf->field = V4L2_FIELD_NONE;
+	vb2_buffer_done(&vbuf->vb2_buf, vaddr ? VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR);
+}
+
+static void axiado_video_capture_work(struct work_struct *work)
+{
+	struct axiado_video *video = container_of(work, struct axiado_video, capture_work);
+
+	axiado_video_capture_one(video);
+
+	if (READ_ONCE(video->streaming))
+		mod_timer(&video->timer, jiffies + READ_ONCE(video->frame_interval));
+}
+
+static void axiado_video_timer_fn(struct timer_list *t)
+{
+	struct axiado_video *video = timer_container_of(video, t, timer);
+
+	schedule_work(&video->capture_work);
+}
+
+static int axiado_video_queue_setup(struct vb2_queue *q,
+				   unsigned int *nbuffers,
+				   unsigned int *nplanes,
+				   unsigned int sizes[],
+				   struct device *alloc_devs[])
+{
+	struct axiado_video *video = vb2_get_drv_priv(q);
+	unsigned int size = video->pix_fmt.sizeimage;
+
+	if (*nplanes) {
+		if (sizes[0] < size)
+			return -EINVAL;
+		return 0;
+	}
+	*nplanes = 1;
+	sizes[0] = size;
+	return 0;
+}
+
+static int axiado_video_buf_prepare(struct vb2_buffer *vb)
+{
+	struct axiado_video *video = vb2_get_drv_priv(vb->vb2_queue);
+	unsigned long sz = video->pix_fmt.sizeimage;
+
+	if (vb2_plane_size(vb, 0) < sz) {
+		dev_err(video->dev,
+			"buffer too small (%lu < %lu)\n",
+			vb2_plane_size(vb, 0), sz);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static void axiado_video_buf_queue(struct vb2_buffer *vb)
+{
+	struct axiado_video *video = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct axiado_video_buffer *buf = to_axiado_video_buffer(vbuf);
+	unsigned long flags;
+
+	spin_lock_irqsave(&video->buf_lock, flags);
+	list_add_tail(&buf->link, &video->pending);
+	spin_unlock_irqrestore(&video->buf_lock, flags);
+}
+
+static int axiado_video_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct axiado_video *video = vb2_get_drv_priv(q);
+
+	video->sequence = 0;
+	WRITE_ONCE(video->streaming, true);
+	mod_timer(&video->timer, jiffies + READ_ONCE(video->frame_interval));
+
+	return 0;
+}
+
+static void axiado_video_stop_streaming(struct vb2_queue *q)
+{
+	struct axiado_video *video = vb2_get_drv_priv(q);
+	struct axiado_video_buffer *buf, *tmp;
+	struct list_head drain;
+	unsigned long flags;
+
+	WRITE_ONCE(video->streaming, false);
+	timer_delete_sync(&video->timer);
+	cancel_work_sync(&video->capture_work);
+	/*
+	 * A capture_work instance that read streaming==true before the
+	 * WRITE_ONCE above may have called mod_timer() just before
+	 * cancel_work_sync() returned.  Delete again to close that window.
+	 */
+	timer_delete_sync(&video->timer);
+
+	INIT_LIST_HEAD(&drain);
+	spin_lock_irqsave(&video->buf_lock, flags);
+	list_splice_init(&video->pending, &drain);
+	spin_unlock_irqrestore(&video->buf_lock, flags);
+
+	list_for_each_entry_safe(buf, tmp, &drain, link) {
+		list_del_init(&buf->link);
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+}
+
+static const struct vb2_ops axiado_video_vb2_ops = {
+	.queue_setup		= axiado_video_queue_setup,
+	.buf_prepare		= axiado_video_buf_prepare,
+	.buf_queue		= axiado_video_buf_queue,
+	.start_streaming	= axiado_video_start_streaming,
+	.stop_streaming		= axiado_video_stop_streaming,
+};
+
+static int axiado_video_querycap(struct file *file, void *fh,
+				struct v4l2_capability *cap)
+{
+	struct axiado_video *video = video_drvdata(file);
+
+	strscpy(cap->driver, AXIADO_VIDEO_DRIVER_NAME, sizeof(cap->driver));
+	strscpy(cap->card, AXIADO_VIDEO_CARD_NAME, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
+		 dev_name(video->dev));
+	return 0;
+}
+
+static int axiado_video_enum_fmt(struct file *file, void *fh,
+				struct v4l2_fmtdesc *f)
+{
+	if (f->index >= ARRAY_SIZE(axiado_video_formats))
+		return -EINVAL;
+	f->pixelformat = axiado_video_formats[f->index].fourcc;
+	return 0;
+}
+
+static int axiado_video_g_fmt(struct file *file, void *fh,
+			     struct v4l2_format *f)
+{
+	struct axiado_video *video = video_drvdata(file);
+
+	f->fmt.pix = video->pix_fmt;
+	return 0;
+}
+
+/*
+ * Reject formats whose sizeimage, or whose 4-bpp XBGR32 source read for
+ * RGB24/YUYV, would not fit in the mapped shared region.  Shared by
+ * TRY_FMT, S_FMT and S_DV_TIMINGS so all three ioctls agree on which
+ * formats are actually usable.
+ */
+static int axiado_video_check_addr_size(const struct axiado_video *video,
+					const struct v4l2_pix_format *p)
+{
+	if (p->sizeimage > video->addr_size) {
+		dev_dbg(video->dev,
+			"sizeimage %u exceeds shared region %zu\n",
+			p->sizeimage, video->addr_size);
+		return -EINVAL;
+	}
+
+	if ((p->pixelformat == V4L2_PIX_FMT_RGB24 ||
+	     p->pixelformat == V4L2_PIX_FMT_YUYV) &&
+	    (size_t)p->width * p->height * 4 > video->addr_size) {
+		dev_dbg(video->dev,
+			"source size %zu exceeds shared region %zu\n",
+			(size_t)p->width * p->height * 4, video->addr_size);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int axiado_video_try_fmt(struct file *file, void *fh,
+			       struct v4l2_format *f)
+{
+	struct axiado_video *video = video_drvdata(file);
+	const struct axiado_video_format *fmt;
+
+	fmt = axiado_video_lookup_format(f->fmt.pix.pixelformat);
+	if (!fmt)
+		fmt = &axiado_video_formats[0];
+
+	axiado_video_clamp_size(&f->fmt.pix);
+	axiado_video_apply_format(&f->fmt.pix, fmt);
+
+	return axiado_video_check_addr_size(video, &f->fmt.pix);
+}
+
+static int axiado_video_s_fmt(struct file *file, void *fh,
+			     struct v4l2_format *f)
+{
+	struct axiado_video *video = video_drvdata(file);
+	int ret;
+
+	if (vb2_is_busy(&video->queue))
+		return -EBUSY;
+
+	ret = axiado_video_try_fmt(file, fh, f);
+	if (ret)
+		return ret;
+
+	video->pix_fmt = f->fmt.pix;
+	return 0;
+}
+
+static int axiado_video_enum_framesizes(struct file *file, void *fh,
+				       struct v4l2_frmsizeenum *fsize)
+{
+	if (fsize->index)
+		return -EINVAL;
+	if (!axiado_video_lookup_format(fsize->pixel_format))
+		return -EINVAL;
+	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+	fsize->stepwise.min_width  = AXIADO_VIDEO_MIN_WIDTH;
+	fsize->stepwise.min_height = AXIADO_VIDEO_MIN_HEIGHT;
+	fsize->stepwise.max_width  = AXIADO_VIDEO_MAX_WIDTH;
+	fsize->stepwise.max_height = AXIADO_VIDEO_MAX_HEIGHT;
+	fsize->stepwise.step_width  = 2;
+	fsize->stepwise.step_height = 2;
+	return 0;
+}
+
+static int axiado_video_enum_input(struct file *file, void *fh,
+				  struct v4l2_input *inp)
+{
+	if (inp->index)
+		return -EINVAL;
+	strscpy(inp->name, "Camera", sizeof(inp->name));
+	inp->type = V4L2_INPUT_TYPE_CAMERA;
+	inp->capabilities = V4L2_IN_CAP_DV_TIMINGS;
+	return 0;
+}
+
+static int axiado_video_g_input(struct file *file, void *fh, unsigned int *i)
+{
+	*i = 0;
+	return 0;
+}
+
+static int axiado_video_s_input(struct file *file, void *fh, unsigned int i)
+{
+	return i ? -EINVAL : 0;
+}
+
+static int axiado_video_g_parm(struct file *file, void *fh,
+			      struct v4l2_streamparm *parm)
+{
+	struct axiado_video *video = video_drvdata(file);
+
+	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+	parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
+	parm->parm.capture.timeperframe.numerator = 1;
+	parm->parm.capture.timeperframe.denominator = READ_ONCE(video->fps);
+	parm->parm.capture.readbuffers = AXIADO_VIDEO_MIN_BUFFERS;
+	return 0;
+}
+
+static int axiado_video_s_parm(struct file *file, void *fh,
+			      struct v4l2_streamparm *parm)
+{
+	struct axiado_video *video = video_drvdata(file);
+	unsigned int num, denom, fps;
+
+	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	if (vb2_is_busy(&video->queue))
+		return -EBUSY;
+
+	num = parm->parm.capture.timeperframe.numerator;
+	denom = parm->parm.capture.timeperframe.denominator;
+	if (!num || !denom)
+		return -EINVAL;
+	fps = clamp(denom / num, 1u, 120u);
+
+	WRITE_ONCE(video->fps, fps);
+	WRITE_ONCE(video->frame_interval, max(1u, HZ / fps));
+
+	parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
+	parm->parm.capture.timeperframe.numerator = 1;
+	parm->parm.capture.timeperframe.denominator = fps;
+	parm->parm.capture.readbuffers = AXIADO_VIDEO_MIN_BUFFERS;
+	return 0;
+}
+
+/*
+ * No digital-video receiver is present; synthesise BT.656/1120 timings
+ * from pix_fmt so that clients using VIDIOC_G/S_DV_TIMINGS to set
+ * the capture geometry see consistent width and height across all ioctls.
+ */
+static void axiado_video_fill_timings(const struct axiado_video *video,
+				      struct v4l2_dv_timings *timings)
+{
+	memset(timings, 0, sizeof(*timings));
+	timings->type = V4L2_DV_BT_656_1120;
+	timings->bt.width = video->pix_fmt.width;
+	timings->bt.height = video->pix_fmt.height;
+	timings->bt.interlaced = V4L2_DV_PROGRESSIVE;
+}
+
+/*
+ * Read the mode the host is actually driving from the control mailbox,
+ * falling back to the configured capture format if it isn't mapped or
+ * hasn't been written yet.
+ */
+static void axiado_video_detect_timings(const struct axiado_video *video,
+					struct v4l2_dv_timings *timings)
+{
+	u32 width, height;
+
+	if (video->ctrl_reg) {
+		width = ioread32(video->ctrl_reg + AX_DP_MODE_DATA);
+		height = ioread32(video->ctrl_reg + AX_DP_MODE_DATA + 4);
+
+		if (width >= AXIADO_VIDEO_MIN_WIDTH &&
+		    width <= AXIADO_VIDEO_MAX_WIDTH &&
+		    height >= AXIADO_VIDEO_MIN_HEIGHT &&
+		    height <= AXIADO_VIDEO_MAX_HEIGHT) {
+			memset(timings, 0, sizeof(*timings));
+			timings->type = V4L2_DV_BT_656_1120;
+			timings->bt.width = width & ~1u;
+			timings->bt.height = height & ~1u;
+			timings->bt.interlaced = V4L2_DV_PROGRESSIVE;
+			return;
+		}
+	}
+
+	axiado_video_fill_timings(video, timings);
+}
+
+static int axiado_video_s_dv_timings(struct file *file, void *fh,
+		struct v4l2_dv_timings *timings)
+{
+	struct axiado_video *video = video_drvdata(file);
+	const struct axiado_video_format *fmt;
+	struct v4l2_pix_format pix;
+	int ret;
+
+	if (timings->type != V4L2_DV_BT_656_1120)
+		return -EINVAL;
+
+	if (vb2_is_busy(&video->queue))
+		return -EBUSY;
+
+	pix = video->pix_fmt;
+	pix.width  = timings->bt.width;
+	pix.height = timings->bt.height;
+	axiado_video_clamp_size(&pix);
+
+	fmt = axiado_video_lookup_format(pix.pixelformat);
+	if (!fmt)
+		fmt = &axiado_video_formats[0];
+	axiado_video_apply_format(&pix, fmt);
+
+	ret = axiado_video_check_addr_size(video, &pix);
+	if (ret)
+		return ret;
+
+	video->pix_fmt = pix;
+	axiado_video_fill_timings(video, timings);
+	return 0;
+}
+
+static int axiado_video_g_dv_timings(struct file *file, void *fh,
+		struct v4l2_dv_timings *timings)
+{
+	axiado_video_fill_timings(video_drvdata(file), timings);
+	return 0;
+}
+
+static int axiado_video_query_dv_timings(struct file *file, void *fh,
+		struct v4l2_dv_timings *timings)
+{
+	axiado_video_detect_timings(video_drvdata(file), timings);
+	return 0;
+}
+
+static int axiado_video_enum_dv_timings(struct file *file, void *fh,
+		struct v4l2_enum_dv_timings *timings)
+{
+	/* No predefined timings; resolution is set freely via S_DV_TIMINGS. */
+	return -EINVAL;
+}
+
+static int axiado_video_dv_timings_cap(struct file *file, void *fh,
+		struct v4l2_dv_timings_cap *cap)
+{
+	cap->type = V4L2_DV_BT_656_1120;
+	cap->bt.min_width  = AXIADO_VIDEO_MIN_WIDTH;
+	cap->bt.max_width  = AXIADO_VIDEO_MAX_WIDTH;
+	cap->bt.min_height = AXIADO_VIDEO_MIN_HEIGHT;
+	cap->bt.max_height = AXIADO_VIDEO_MAX_HEIGHT;
+	cap->bt.standards  = 0;
+	cap->bt.capabilities = V4L2_DV_BT_CAP_PROGRESSIVE;
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops axiado_video_ioctl_ops = {
+	.vidioc_querycap		= axiado_video_querycap,
+	.vidioc_enum_fmt_vid_cap	= axiado_video_enum_fmt,
+	.vidioc_g_fmt_vid_cap		= axiado_video_g_fmt,
+	.vidioc_s_fmt_vid_cap		= axiado_video_s_fmt,
+	.vidioc_try_fmt_vid_cap		= axiado_video_try_fmt,
+	.vidioc_enum_framesizes		= axiado_video_enum_framesizes,
+	.vidioc_enum_input		= axiado_video_enum_input,
+	.vidioc_g_input			= axiado_video_g_input,
+	.vidioc_s_input			= axiado_video_s_input,
+	.vidioc_g_parm			= axiado_video_g_parm,
+	.vidioc_s_parm			= axiado_video_s_parm,
+	.vidioc_s_dv_timings		= axiado_video_s_dv_timings,
+	.vidioc_g_dv_timings		= axiado_video_g_dv_timings,
+	.vidioc_query_dv_timings	= axiado_video_query_dv_timings,
+	.vidioc_enum_dv_timings		= axiado_video_enum_dv_timings,
+	.vidioc_dv_timings_cap		= axiado_video_dv_timings_cap,
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+};
+
+static const struct v4l2_file_operations axiado_video_fops = {
+	.owner		= THIS_MODULE,
+	.open		= v4l2_fh_open,
+	.release	= vb2_fop_release,
+	.read		= vb2_fop_read,
+	.poll		= vb2_fop_poll,
+	.mmap		= vb2_fop_mmap,
+	.unlocked_ioctl	= video_ioctl2,
+};
+
+static int axiado_video_init_queue(struct axiado_video *video)
+{
+	struct vb2_queue *q = &video->queue;
+
+	q->type		= V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	q->io_modes	= VB2_MMAP | VB2_READ;
+	q->drv_priv	= video;
+	q->buf_struct_size = sizeof(struct axiado_video_buffer);
+	q->ops		= &axiado_video_vb2_ops;
+	q->mem_ops	= &vb2_vmalloc_memops;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->min_queued_buffers = AXIADO_VIDEO_MIN_BUFFERS;
+	q->lock		= &video->video_lock;
+
+	return vb2_queue_init(q);
+}
+
+/*
+ * Called when the last reference on v4l2_dev drops, i.e. after both
+ * vb2_video_unregister_device() has run in remove() AND all open file
+ * descriptors have been released.  This is the documented V4L2 lifetime
+ * mechanism for an embedded struct video_device (v4l2-dev.rst).
+ */
+static void axiado_v4l2_device_release(struct v4l2_device *v4l2_dev)
+{
+	struct axiado_video *video =
+		container_of(v4l2_dev, struct axiado_video, v4l2_dev);
+
+	memunmap(video->addr);
+	kfree(video);
+}
+
+static int axiado_video_probe(struct platform_device *pdev)
+{
+	struct axiado_video *video;
+	struct device_node *node;
+	struct resource res;
+	int ret;
+
+	video = kzalloc_obj(*video, GFP_KERNEL);
+	if (!video)
+		return -ENOMEM;
+
+	video->dev = &pdev->dev;
+	platform_set_drvdata(pdev, video);
+
+	mutex_init(&video->video_lock);
+	spin_lock_init(&video->buf_lock);
+	INIT_LIST_HEAD(&video->pending);
+	timer_setup(&video->timer, axiado_video_timer_fn, 0);
+	INIT_WORK(&video->capture_work, axiado_video_capture_work);
+
+	video->pix_fmt.width  = AXIADO_VIDEO_DEF_WIDTH;
+	video->pix_fmt.height = AXIADO_VIDEO_DEF_HEIGHT;
+	axiado_video_apply_format(&video->pix_fmt, &axiado_video_formats[0]);
+	video->fps = AXIADO_VIDEO_DEF_FRAMERATE;
+	video->frame_interval = max(1u, HZ / AXIADO_VIDEO_DEF_FRAMERATE);
+
+	node = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
+	if (!node) {
+		ret = dev_err_probe(&pdev->dev, -EINVAL, "missing memory-region\n");
+		goto err_free;
+	}
+	ret = of_address_to_resource(node, 0, &res);
+	of_node_put(node);
+	if (ret) {
+		ret = dev_err_probe(&pdev->dev, ret, "memory-region address invalid\n");
+		goto err_free;
+	}
+
+	video->addr_size = resource_size(&res);
+	video->addr = memremap(res.start, video->addr_size, MEMREMAP_WC);
+	if (!video->addr) {
+		ret = dev_err_probe(&pdev->dev, -ENOMEM,
+				    "memremap of shared region failed\n");
+		goto err_free;
+	}
+
+	if (video->pix_fmt.sizeimage > video->addr_size) {
+		ret = dev_err_probe(&pdev->dev, -EINVAL,
+				    "shared region %zu too small for default %ux%u XBGR32 frame\n",
+				    video->addr_size,
+				    AXIADO_VIDEO_DEF_WIDTH, AXIADO_VIDEO_DEF_HEIGHT);
+		goto err_memunmap;
+	}
+
+	/* Optional control mailbox (second memory-region entry). */
+	node = of_parse_phandle(pdev->dev.of_node, "memory-region", 1);
+	if (node) {
+		struct resource ctrl_res;
+
+		ret = of_address_to_resource(node, 0, &ctrl_res);
+		of_node_put(node);
+		if (!ret) {
+			video->ctrl_reg = devm_memremap(&pdev->dev, ctrl_res.start,
+							resource_size(&ctrl_res),
+							MEMREMAP_WB);
+			if (!video->ctrl_reg)
+				dev_warn(&pdev->dev,
+					 "failed to map control mailbox; DV timings will echo capture format\n");
+		}
+	}
+
+	ret = v4l2_device_register(&pdev->dev, &video->v4l2_dev);
+	if (ret)
+		goto err_memunmap;
+	video->v4l2_dev.release = axiado_v4l2_device_release;
+
+	ret = axiado_video_init_queue(video);
+	if (ret)
+		goto err_v4l2_unreg;
+
+	video->vdev.fops	= &axiado_video_fops;
+	video->vdev.ioctl_ops	= &axiado_video_ioctl_ops;
+	video->vdev.v4l2_dev	= &video->v4l2_dev;
+	video->vdev.queue	= &video->queue;
+	video->vdev.lock	= &video->video_lock;
+	video->vdev.release	= video_device_release_empty;
+	video->vdev.vfl_dir	= VFL_DIR_RX;
+	video->vdev.device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+				  V4L2_CAP_READWRITE;
+	strscpy(video->vdev.name, AXIADO_VIDEO_DRIVER_NAME,
+		sizeof(video->vdev.name));
+	video_set_drvdata(&video->vdev, video);
+
+	ret = video_register_device(&video->vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(&pdev->dev, "video_register_device: %d\n", ret);
+		goto err_v4l2_unreg;
+	}
+
+	dev_info(&pdev->dev, "registered as /dev/video%d\n",
+		 video->vdev.num);
+	return 0;
+
+err_v4l2_unreg:
+	v4l2_device_put(&video->v4l2_dev);
+	return ret;
+err_memunmap:
+	memunmap(video->addr);
+err_free:
+	kfree(video);
+	return ret;
+}
+
+static void axiado_video_remove(struct platform_device *pdev)
+{
+	struct axiado_video *video = platform_get_drvdata(pdev);
+
+	vb2_video_unregister_device(&video->vdev);
+	/*
+	 * Drop the reference held since v4l2_device_register().  If all file
+	 * descriptors are already closed this triggers axiado_v4l2_device_release
+	 * immediately; otherwise it fires when the last fd is released.
+	 */
+	v4l2_device_put(&video->v4l2_dev);
+}
+
+static int axiado_video_suspend(struct device *dev)
+{
+	struct axiado_video *video = dev_get_drvdata(dev);
+
+	if (!READ_ONCE(video->streaming))
+		return 0;
+
+	/*
+	 * Clear streaming before stopping so that any capture_work instance
+	 * still executing won't re-arm the timer.  Apply the same
+	 * double-delete pattern used in stop_streaming to close the race
+	 * window between the work's READ_ONCE and the timer re-arm.
+	 */
+	WRITE_ONCE(video->streaming, false);
+	timer_delete_sync(&video->timer);
+	cancel_work_sync(&video->capture_work);
+	timer_delete_sync(&video->timer);
+	return 0;
+}
+
+static int axiado_video_resume(struct device *dev)
+{
+	struct axiado_video *video = dev_get_drvdata(dev);
+
+	/*
+	 * vb2_is_streaming() is the authoritative source for whether capture
+	 * was active before suspend, since we cleared video->streaming above.
+	 */
+	if (vb2_is_streaming(&video->queue)) {
+		WRITE_ONCE(video->streaming, true);
+		mod_timer(&video->timer, jiffies + READ_ONCE(video->frame_interval));
+	}
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(axiado_video_pm_ops,
+				axiado_video_suspend, axiado_video_resume);
+
+static const struct of_device_id axiado_video_of_match[] = {
+	{ .compatible = "axiado,ax3000-video" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, axiado_video_of_match);
+
+static struct platform_driver axiado_video_driver = {
+	.driver = {
+		.name		= AXIADO_VIDEO_DRIVER_NAME,
+		.of_match_table	= axiado_video_of_match,
+		.pm		= pm_sleep_ptr(&axiado_video_pm_ops),
+	},
+	.probe	= axiado_video_probe,
+	.remove	= axiado_video_remove,
+};
+module_platform_driver(axiado_video_driver);
+
+MODULE_AUTHOR("Axiado Corporation");
+MODULE_DESCRIPTION("Axiado AX3000 V4L2 video capture driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

