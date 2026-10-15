Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E271F4A482A
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 16:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082183; cv=none; b=avEEMDM2DepXS0zpBJEWKvO+4PZu2HerZtsxW0Iq9zcr+9i+bWqxuwliEtpx7GJKe+IZEAbNqKalqSmSx831rIo7xw+1UCiiBFNufRixD9ZfNDKUi5Pf+e41X7Vq+fnqfIzeFUUnK0mEt5ye5ReMN9s3y/bOMnSSu3l++pWA1Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082183; c=relaxed/simple;
	bh=Xa7gc1Cb2AZVvx1vvgm0nrvmeU+/MARaO6KkTtVOHZs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gZI3SUcQAa6YK5Q8W3ndF8wpjGVKnm0sFwzezQtuBrDEjjW7zW11Z66rBXuqLj00eFgeTcMT8GMNIFFe05Les1aVnKqjXwjOT3zx43MmGOYxQ5sjHwpZ9N7fge+uD+2GmpieEyn3iJ7Hr7IbAuksuY4ZZzZ0nyzoKgtgPolXq3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn; spf=pass smtp.mailfrom=stu.xidian.edu.cn; dkim=fail (0-bit key) header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.b=n2KYXE55 reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.b="n2KYXE55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=+pXBKqBvYNPj5huxOC+avN4dmOZyhGkwrd
	ge1wfduAM=; b=n2KYXE557YFVL6nBNDFKPM+7pb4CVQoQftLzGrxjiA3ByEs9y1
	jHUSlTZizVyUfNS9BVfnL8m1gU1r6DXJAqzzt5lT40R4dUywITlPYFtHL5FGI8mn
	A0pP9L5lOlxyMt9J2hT/jWITVf9xux8qraWDqYhXHSdEbVQ9p81BekSTw=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.59])
	by hzbj-edu-front-3.icoremail.net (Coremail) with UTF8SMTPA id BbQMCkCGjgHyANFqZd+kAA--.13770S2;
	Fri, 16 Oct 2026 00:36:02 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: linux-media@vger.kernel.org
Cc: YuanZhe Liu <25031212351@stu.xidian.edu.cn>,
	Patchwork Integration <patchwork@media-ci.org>,
	Linux Media CI <media-ci@linuxtv.org>
Subject: Re: [0/3] media: dvb: fix use-after-free family in dvb-core and dvb-usb disconnect paths
Date: Fri, 16 Oct 2026 00:36:01 +0800
Message-Id: <20261016005500.44231-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6ab70048.a932eb10.38b8b.32d0@mx.google.com>
References: <20260923092454.969-1-25031212351@stu.xidian.edu.cn> <6ab70048.a932eb10.38b8b.32d0@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BbQMCkCGjgHyANFqZd+kAA--.13770S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF4UXrWxCrWUGw17AFyDAwb_yoW8tF1UpF
	Z3tF13tFWUGr10vFWIyw18urn8Z3WrArW5GwnxJ3yDJF45GFySqFWvq3WDZryDKrs2934Y
	vws0gay0kayUAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwCY02Avz4vE14v_JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x0pRKjgsUUUUU=
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAgUHD2rQ7rwN0wAAs5

Hello,

thank you for the detailed report on job 111198927.  Version 2 of the
series has been posted; the findings split into two groups.

Caused by v1 of this series, fixed in v2:

* cocci:test-coccinelle - the six "preceding lock" warnings in
  dvb-core/dvb_frontend.c (lines 2899/2906 vs. the mfe_lock
  acquisitions): v1 [PATCH 2/3] added an early "return ret;" on the
  dvb_frontend_open() error path and in dvb_frontend_release(), which
  skipped mutex_unlock(&adapter->mfe_lock) (and the frontend kref
  drop) on those paths.  [PATCH 2/3] is reworked in v2: the extra
  dvb_device reference is taken before dvb_generic_release() and
  dropped again right after the ->users check, with no early return
  anywhere, so the lock and kref control flow is identical to
  mainline.

* media-patchstyle:test-valid-ancestor - v1 was not based on a
  media-committers branch.  v2 is rebased onto the `fixes` branch
  (base 2579cbe68005f46fc7f8f95364f6b101b07b9d1c).

Not caused by this series:

* bisect:0001, bisect:0002, build-basic:x86_64, build-basic:x86,
  static:test-smatch and static:test-sparse all fail on
  drivers/platform/x86/intel/int3472/discrete.c:346
  ("'err_msg' undeclared"), before any code of this series is
  compiled.  The series touches only drivers/media/dvb-core and
  drivers/media/usb/dvb-usb.  On the media fixes base of v2,
  skl_int3472_handle_gpio_resources() declares "const char *err_msg;"
  (discrete.c:332) and the "Failed to register clock" assignment is
  at line 398, so the CI tree appears to contain a different, broken
  revision of that driver.

* media-patchstyle:rc core - all 14 errors are in include/media/
  rc-map.h and Documentation/devicetree/bindings/media/rc.yaml,
  untouched by this series.

* static:test-smatch buffer-overflow reports (v4l2-dev.c, adv7604.c,
  amlogic c3-isp, wave5, ipu3), static:test-sparse (atmel_mxt_ts.c)
  and the remaining test-coccinelle warnings (helene.c, mali-c55,
  iris) are in files that this series does not modify; the same was
  true for v1, where checkpatch and the media-patchstyle style checks
  passed.

Please let me know if anything on the series side still needs work.

Best regards,
YuanZhe Liu

