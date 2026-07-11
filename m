Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB66B28136F;
	Sat, 11 Jul 2026 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783781348; cv=pass; b=Sx7M46Ep01AfLnJK+2+c9dWZeRrvXyODSgAdeGEIxe6Oy1nM60wLa4vVefpHfGPSnvTaF5rPzTc/MPG8Gpe+e1jRQWnPm6BJC9aZ4vMFOEHnROdESwYtwkXwVlql2L8RUH869Wm47r/kjqSCY/wFOXKb1rTKnU9fVEBaK+bcGME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783781348; c=relaxed/simple;
	bh=64xmhQig0YSiaK7xERCHA2H1HKG3glwpBWzho00/fXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9Gv86rzi9ZUtH5xsvcfGhAZIthVr+LhRIdFpf8pnIioLYYhNv8/iRXGTX81FOwB4+PDdlZo0UPCnn2UrAuB8XV04cLF9a465usrZlHS5JdlaJuSZryUik6NtqemnycWCxx16D3NlePn5rtTCOU/nAV+Ad/u552PT+fx8T7sOgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=robert.mader@collabora.com header.b=lFe06t0V; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=robert.mader@collabora.com header.b="lFe06t0V"
ARC-Seal: i=1; a=rsa-sha256; t=1783781337; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pj8aR3IrKz+/CtebXwpLpunMYcMVL0mBNT1XAIp10WtYHkaOj8JX5sIXHS+WapMYXd3i3phiX83zHGUI6NXCsyAjZeC/+DIGbMXCiv2RTF3e/G0+PAwCwUdQUy4OHryCspfM443MTNW875ZKwBS4W+GjTWIeuo5pwRKafSDoFbc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783781337; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8EhoijJuAVpKhH0B/9K0NROY2MQn/U8qlWzqclSATrk=; 
	b=VEtw4m1/C/z+o3/zqtg70bZY5pqWW581LCIzm202l3ducVlq5xlGUHcSKFPjk+q1Ccylq+obuSC72363W6uk/8uvEWjrRDtRzrz5Lv2qhUVt2rqIIfbYeVrPJKjqZPY8dHQ8UU48iq0gep7c0Zo8pWsOBg8idEtSfJ9kIackBrU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=robert.mader@collabora.com;
	dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783781336;
	s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8EhoijJuAVpKhH0B/9K0NROY2MQn/U8qlWzqclSATrk=;
	b=lFe06t0VSWW7qAZWgQqe49gBXNN6/gxc/dfXhAFhRuvDeHfPoWcol7AAhZGIoIs4
	q1rBuF02J43wuAdbflnunKCaHyUV92ULV8yjVMdef5k7okwidKSKSO8lik4HxwrFxcu
	CCkpCU4SYD+6HJwUnLyRIFMxXdQGpFDNCURiPU18=
Received: by mx.zohomail.com with SMTPS id 1783781333885846.2310772290999;
	Sat, 11 Jul 2026 07:48:53 -0700 (PDT)
From: Robert Mader <robert.mader@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] dma-buf/udmabuf: Increase default size limit to 256MB
Date: Sat, 11 Jul 2026 16:48:13 +0200
Message-ID: <20260711144814.8205-2-robert.mader@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260711144814.8205-1-robert.mader@collabora.com>
References: <20260711144814.8205-1-robert.mader@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While there does not seem to be a particularly strong reason to have a
size limit for udmabufs in the first place, raising the limit moderatly
to 256MB is enough to avoid hitting the limit in increasingly common
use-cases - notably allocating video buffers for 8K resolutions.

Signed-off-by: Robert Mader <robert.mader@collabora.com>
---
 drivers/dma-buf/Kconfig   | 4 ++--
 drivers/dma-buf/udmabuf.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index 35f0779cdc80..0e7f5dc978e2 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -42,9 +42,9 @@ config UDMABUF
 
 config UDMABUF_SIZE_LIMIT_MBYTES
 	int "Size limit in Mega Bytes"
-	default 64
+	default 256
 	help
-	  Maximum size of a udmabuf, in megabytes. Default is 64.
+	  Maximum size of a udmabuf, in megabytes. Default is 256.
 
 config DMABUF_DEBUG
 	bool "DMA-BUF debug checks"
diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index a83153326362..c7649a04b865 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -23,10 +23,10 @@ MODULE_PARM_DESC(list_limit, "udmabuf_create_list->count limit. Default is 1024.
 #ifdef CONFIG_UDMABUF_SIZE_LIMIT_MBYTES
 static int size_limit_mb = CONFIG_UDMABUF_SIZE_LIMIT_MBYTES;
 #else
-static int size_limit_mb = 64;
+static int size_limit_mb = 256;
 #endif
 module_param(size_limit_mb, int, 0644);
-MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is 64.");
+MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is 256.");
 
 struct udmabuf {
 	pgoff_t pagecount;
-- 
2.55.0

