Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076110;
	b=PcuMUzETKF82fI3VifwNSAB2vlzJAH32hrrlE7Pvn2aHEoJnIXC0nJgKPpjX3qg74la3
	 WFwWc5UxI1Cqqtntz6k9EoOmlaetDk+Yf/k2zHzZzQMHc+DJ8Smfp9q/81cZUWbTaGrky
	 2hCHRT+9nbX30tT69t0G/5amFw8ZXkI6Dc08Bg+aiQRYCW70ndH2dvBQNYVYKauOqjSce
	 hpmGwQLIulHykrGg/B12t4lazjyv7KguPIKViO+0CqqPwH67ELH1vQoJ3HRmsJBbh75Or
	 vlc8zOcDWXolnK6+R+QWBblUjL0r9CjINYitbLwAO6olLtEHprFt9Tbuh4WTyaR9gMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076110;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=l9RGs4BDvEAPJGPC1B7Y5D7yby+dqFQdmB19pLlvL/k=;
	b=4UUiPzuovu33Y/iDnNXGfNYgiyUJycVgmwbPVim3oVMPxaFzIeI8IK8/RvH8q7If0tsJ
	 WumXmrTcasv9OvH2FJm4VfxN2iS8fHRdMXf6gEh5/UjwKNuHaGAlWGLvKL6IrJCiMhh1k
	 sJlHbETS2Qg0Iu0Lfj9jlS1msHI/Ob/BtWvdPgzNHTuoaFqV7s0B2tMOTCt5Adl9g5VUt
	 +CS6ORsuekRVf2fvP1ZiYUff8EmDLlfjZyjCFXrGDT2tYJhWd4+f9iMWIc/GM2ypn6trE
	 JqiEjryywfWUS2J8oXk3Z4JE9ekCOqcMfw4MQtd5DqVexjY/Aw8d538eYFcMmwTjWGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=n1+27df2;
	arc=none smtp.remote-ip=132.226.202.154
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C884E60A2602;
	Thu, 19 Nov 2026 08:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C884E60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=n1+27df2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=l9RGs4BDvEAPJGPC1B7Y5D7yby+dqFQdmB19pLlvL/k=; b=n1+27df2ubGwf
	6Wz1PvSkLl0YmiFaZrUEHxHlfo5gubmVG1yhEK+HFEEBouUBvmuiXKLd0Gc4gM/w
	eTMiDu+oBN5MvrhFR0NX1kvYPJj12w6Z/i/idrtyOp+xhK6I6pseM+YLM7vg+uXO
	8qWNJTg02j9suWy6mVft0F3Y4eOqyU=
Received: from 01.eml (unknown [58.206.202.11])
	by web2 (Coremail) with SMTP id yQQGZQBHdWn3r_5qGSJLAQ--.57096S2;
	Thu, 19 Nov 2026 16:14:47 +0800 (CST)
From: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com
Cc: ogabbay@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, wanghr2026@mail.zgclab.edu.cn
Subject: [PATCH] accel/qaic: hold the dma_resv lock when mapping imported buffers
Date: Thu, 19 Nov 2026 16:14:48 +0800
Message-ID: <1795076088845-1-b103cfa7@mail.zgclab.edu.cn>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yQQGZQBHdWn3r_5qGSJLAQ--.57096S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF15Gry8CrW7tw43tF1fWFg_yoW8urW5pF
	WFgr9rCrZ0qr48ZFWUZ3yUKw1Ykw4Yk34UZF4DJa4SvFn8WrnIvr1UKFnxAFnIgr1DAF90
	vr17u393ur9rAF7anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAaw2AFwI0_Jrv_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28I
	cVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx
	0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I2
	1c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r
	1q6r43MxkIecxEwVAFwVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUeWrWDUUUU
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAgEQD2r+J8-7xgADse

qaic_prepare_import_bo() maps an imported dma-buf with
dma_buf_map_attachment() and qaic_unprepare_import_bo() unmaps it with
dma_buf_unmap_attachment().  Those are the locked variants: the dma-buf
locking convention requires importers to hold the buffer's reservation
lock when calling them, and both assert it via dma_resv_assert_held(),
i.e. lockdep_assert_held() on attach->dmabuf->resv.

qaic calls both without holding the reservation lock, so on a
lockdep-enabled kernel every slice attach/detach against an imported
buffer trips the lockdep assertion (a WARNING with a backtrace).  The
reservation lock also serializes the importer against the exporter
moving or invalidating the buffer's backing storage for a dynamic
attachment, so an unlocked map can race that move and use a stale
sg_table.

Hold the reservation lock around the map and unmap calls, which is
equivalent to the dedicated dma_buf_map_attachment_unlocked() and
dma_buf_unmap_attachment_unlocked() helpers.

Signed-off-by: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Fixes: ff13be830333 ("accel/qaic: Add datapath")
---

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index ee35e13091b3..0b57f8d544a2 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -895,7 +895,9 @@ static int qaic_prepare_import_bo(struct qaic_bo *bo, struct qaic_attach_slice_h
 	struct sg_table *sgt;
 	int ret;
 
+	dma_resv_lock(obj->resv, NULL);
 	sgt = dma_buf_map_attachment(obj->import_attach, hdr->dir);
+	dma_resv_unlock(obj->resv);
 	if (IS_ERR(sgt)) {
 		ret = PTR_ERR(sgt);
 		return ret;
@@ -936,7 +938,9 @@ static int qaic_prepare_bo(struct qaic_device *qdev, struct qaic_bo *bo,
 
 static void qaic_unprepare_import_bo(struct qaic_bo *bo)
 {
+	dma_resv_lock(bo->base.resv, NULL);
 	dma_buf_unmap_attachment(bo->base.import_attach, bo->sgt, bo->dir);
+	dma_resv_unlock(bo->base.resv);
 	bo->sgt = NULL;
 }
 

---

The vulnerability was found by static analysis.

