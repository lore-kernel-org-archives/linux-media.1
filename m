Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.189.79.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076103;
	b=nxlTNwMhqZD0ClTloLHhPs2UJD+N52pCt6YiL3pXaPqfZyWoyPUauh0KEVF+B6D5mfVq
	 TQa4Rl5uoaaoDQTo+k1TNQgOprAyb0aypT3M+f+DUfXAreOeF+EQ8P69gJ5mgO82KyJqb
	 Pi5+D9kC30xD4u4+uE1GEuaZSeRDBqiq7ZWNJ4nmA7v1C5PyVHA3iSJ9LcEaumukwGd/k
	 FN5LDkWpkYq/gfgIi3Q1sikCyl+CDOj+g5b8BSHyuoFawvp9ItyrQtSG8czr7F5TUU3O0
	 ufLfRNeyzSiX6z/7PJueYAxk11mDMd7CIayXQfkItuz4nWo1J1c/iESntS8U7cwbToA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076103;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=j9Ticeczrk4bisJpNBsHWKj8euFNqV2BLFd8qqYZfT8=;
	b=idZJqFvvAQ/xnmAycUn7MngfsY2t1/VRMA+pVxfmLFm0kYQhMcln0bRAs8W7PsVkchdx
	 ZxwuWQQwk3H+ht3trGXGlyRNuxIJN6D8/Qb3XYbFX3z++JN5dWGeq/7eRQSgld5wb6NdL
	 6jU6OghqyU1AFsPm9pyA4CtHkpY/PpEvG4596Ki6Mcio5u2pRLbv5aXmIII61JFOMNLX1
	 LU4+lmNKegPW3gF4ISCJzwIxOQ+wxGQCZYoLYIq3pnpVoarl2VjXjMgr7pwpZM5jvPhCd
	 ErzkimukYTU4lLCn7MnyFpAx3OrZ8WRwRldQoxuJKlO/+lyYcuYQhu25CSL4Egwed1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=GEQxMFKH;
	arc=none smtp.remote-ip=206.189.79.184
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58632606A338;
	Thu, 19 Nov 2026 08:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58632606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=GEQxMFKH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=j9Ticeczrk4bisJpNBsHWKj8euFNqV2BLFd8qqYZfT8=; b=GEQxMFKH8wXrd
	aDdWVxT6ptb+DL52A68gngSOdJp4ZSDDJrpgtOFzjc9YAkxk/iF/djelHtbT/rlr
	qAIcnSDI/WGLwndQ6+wbO4+v1w3kTzarLnPkrDIrRDFFBWz69dyYsil77xMSE89f
	eTFHDh5BBnkJEkIqAHnf89FptC+u+8=
Received: from 06.eml (unknown [58.206.202.11])
	by web2 (Coremail) with SMTP id yQQGZQBHcmYBsP5qVSJLAQ--.56740S2;
	Thu, 19 Nov 2026 16:14:57 +0800 (CST)
From: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
To: sakari.ailus@linux.intel.com, dan.scally@ideasonboard.com
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, wanghr2026@mail.zgclab.edu.cn
Subject: [PATCH] media: i2c: dw9719: disable vdd on detection failure
Date: Thu, 19 Nov 2026 16:14:58 +0800
Message-ID: <1795076098490-6-83db7e12@mail.zgclab.edu.cn>
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
X-CM-TRANSID:yQQGZQBHcmYBsP5qVSJLAQ--.56740S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyxZr48Xr17XF1xurW7Arb_yoW8uF4DpF
	ZFvrZIyrW8K3WxuF45ua4IvFyFy3WxA3ySkryfGw4Uuw15uas5JFyxGa4Y93W09r18A3W2
	vws8Xry8A3ZF9FJanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAaw2AFwI0_Jrv_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28I
	cVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx
	0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I2
	1c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8ZwCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC2
	0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
	0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv2
	0xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
	IE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI
	43ZEXa7VUjSdgtUUUUU==
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAQMQD2r+rmUDMAAAsx

dw9719_power_up() enables the vdd regulator but neither the INFO register
read error nor the unknown device id path disables it again, and the probe
error path does not call dw9719_power_down(). Device detection is the
driver's normal hot-plug path, so a missing or mismatched module leaves the
VCM rail enabled after every failed probe and _regulator_put() warns on the
leaked enable.

Disable the regulator on these detection failures.

Signed-off-by: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Fixes: fed60fc552c8 ("media: i2c: Add driver for DW9719 VCM")
---

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 5d5da0439dba..d1aef321e26c 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -149,8 +149,10 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 		}
 
 		ret = cci_read(dw9719->regmap, DW9719_INFO, &val, NULL);
-		if (ret < 0)
+		if (ret < 0) {
+			dw9719_power_down(dw9719);
 			return ret;
+		}
 
 		switch (val) {
 		case DW9719_ID:
@@ -168,6 +170,7 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 		default:
 			dev_err(dw9719->dev,
 				"Error unknown device id 0x%02llx\n", val);
+			dw9719_power_down(dw9719);
 			return -ENXIO;
 		}
 

---

PoC reproduction (7.4.0-rc2, arm64 QEMU virt, unmodified kernel):

Route 1 (i2c-stub, no DT injection needed):

    modprobe i2c-stub chip_addr=0x2c
    echo "dw9719 0x40" > /sys/bus/i2c/devices/i2c-0/new_device

The probe powers up the device and the INFO register read fails on the
unanswered address.

Result:

    i2c i2c-0: new_device: Instantiated device dw9719 at 0x40
    dw9719 0-0040: Error reading reg 0x0000: -19
    WARNING: drivers/regulator/core.c:2678 at _regulator_put

The regulator-dummy use count rises by one on every failed probe (and on
every delete/new_device retry) and never drops.

Note: the PoC was generated with AI assistance and the vulnerability was
found by static analysis. Triggering the failed probe via sysfs requires
root, so this is not a security fix, but it prevents a potential resource
leak on a failed probe.

