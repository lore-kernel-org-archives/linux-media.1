Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.75.44.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076106;
	b=kcGRK59isMfCLAgOoC4HNvtt/6CfJR3Q2mZtYsDTMyxrJCUlo6ADiGay//74v2UmaoHp
	 D29Ztv35gduxOZBfQPnoFd8r8ySGm9/U5PHuh0ZHfE0vBF8QVcY3HqmT9qbzpC9qYB9rS
	 Srzrr5Z04UxzkgGDbh942MgxLvcrT5/mzKuYeoQ4QPMYslu0fbvJtV1+m/ONy9O7II9ta
	 YX8qyRERnlMtGPOEUEuoamjeE9eae8yCwmshi+wf7sOKi2DsRHIFyuGm7kTOsBeftGlPU
	 l8KaFzcd373dCar02/qg/iH2Rg6+Q3cg1/3Qp67kL+xtLTZX2YSwVQPkkl/rHyrwAXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076106;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=c+Xf68Xig8eN6y0cDL2+uaRvXFSlaAjuzTq4Gvfamso=;
	b=xZrLDa43uotknbqWLdv18mb1lo6XRsrRs6OFK4/8UWFEznSRykyMtdx2TD+TzFKNb5gw
	 omhg7OyoD2XRVqrK4ebARA1Qg9ntiejnaU41mGksMLFvLFc4isT7cURPajFVLOpnINQC2
	 9NjBuqiSKO/mHoiF0TQ/8lYb10o5cAqo/0Sn9dc4wMs4027NxcRr/QG6mqaNYdw3ngZaz
	 djVnXSM4YtRRt6/LNjMOiXTYiV/NYNYT3WeOtZoWkooPQUGcUFbh4OisI22ufB9veH9NY
	 zkGaQgSUKra9sCPG5Xolv29pkFenzahWQzV24mRzKV4ovEX9R4W9jTHCC13NN5Ff5MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=X8X8BsAL;
	arc=none smtp.remote-ip=13.75.44.102
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8791760A3804;
	Thu, 19 Nov 2026 08:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8791760A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=X8X8BsAL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=c+Xf68Xig8eN6y0cDL2+uaRvXFSlaAjuzTq4Gvfamso=; b=X8X8BsAL8KC4U
	VlJHGrlEBL72yy1wKP7BNIkjGHeuYY4gWayDdlq1qaBZq1UDe/qle1hm9Sxyo/B8
	8PpmrlkNbiucfyP5tlw2Ag4lUw5Dw8o/0Jv1n39lSR+J3vJf/UysLAnp1cunioDi
	TRNrPkxRxAjP+Vg4qfU32sQmjadoWM=
Received: from 05.eml (unknown [58.206.202.11])
	by web4 (Coremail) with SMTP id ywQGZQDnpAL+r_5qp7whAg--.6701S2;
	Thu, 19 Nov 2026 16:14:54 +0800 (CST)
From: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
To: mehdi.djait@bootlin.com
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, wanghr2026@mail.zgclab.edu.cn
Subject: [PATCH] media: i2c: tw9900: disable vdd on resume failure
Date: Thu, 19 Nov 2026 16:14:55 +0800
Message-ID: <1795076095438-5-e3a836e0@mail.zgclab.edu.cn>
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
X-CM-TRANSID:ywQGZQDnpAL+r_5qp7whAg--.6701S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4kGFyUXFy7JFWxKFWxZwb_yoW8ur47pF
	Z2vFnFyrW09F109a9rA342qF1rJw4xKrZ7Zry8Wa98uw1rJFn3tFWkX345Za1kCrykG3W8
	tayDZ3yxAFsFgFJanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAaw2AFwI0_Jrv_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28I
	cVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx
	0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I2
	1c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8ZwCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC2
	0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
	0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
	0xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
	IE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI
	43ZEXa7VUjSdgtUUUUU==
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAQUQD2r+rmUDLwAAso

tw9900_runtime_resume() enables the vdd regulator but if the init register
writes fail the regulator is left enabled and the resume error sets
runtime_error, after which runtime_suspend() is never called again. The
only regulator_disable() lives in runtime_suspend(), so a single I2C error
in the first resume (which happens during probe's check_id) leaves the rail
enabled until reboot, even across unbind and probe retries.

Disable the regulator when the register write fails.

Signed-off-by: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Fixes: 918b14a26b12 ("media: i2c: Introduce a driver for the Techwell TW9900 decoder")
---

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 51db5d5ddbde..b4fb566807a8 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -624,6 +624,8 @@ static int tw9900_runtime_resume(struct device *dev)
 
 	ret = tw9900_write_array(tw9900->client, tw9900_init_regs,
 				 ARRAY_SIZE(tw9900_init_regs));
+	if (ret)
+		regulator_disable(tw9900->regulator);
 
 	mutex_unlock(&tw9900->mutex);
 

---

PoC reproduction (7.4.0-rc2, arm64 QEMU virt, unmodified kernel):

Route 1 (i2c-stub, no DT injection needed):

    modprobe i2c-stub chip_addr=0x2c
    echo "tw9900 0x40" > /sys/bus/i2c/devices/i2c-0/new_device

The probe triggers the first runtime_resume during check_id and the init
register write fails on the unanswered address.

Result:

    i2c i2c-0: new_device: Instantiated device tw9900 at 0x40
    tw9900 0-0040: write reg error: -19
    WARNING: drivers/regulator/core.c:2678 at _regulator_put

The regulator-dummy use count rises by one on every failed probe (and on
every delete/new_device retry) and never drops, because runtime_suspend is
blocked by the runtime_error state.

Note: the PoC was generated with AI assistance and the vulnerability was
found by static analysis. Triggering the failed probe via sysfs requires
root, so this is not a security fix, but it prevents a potential resource
leak on a failed probe.

