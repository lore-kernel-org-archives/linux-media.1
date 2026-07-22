Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905431C01
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 05:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784699204; cv=none; b=XPxsx3E+kUeSOXdUOpFwYZl+iCi/rX530YG8hxDDS2SkWVUlnRXoRMpKsNhglH0WrUYjmmlE4RJXdSQWHwe1AsXHi7GLWhyu8oRLu+bF1TGzgA65mQJUkXs+qcA5Q6AWtBBZ67zcPDEAX8TfyhJuNN452i1MNnlBmIXTGoCBLM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784699204; c=relaxed/simple;
	bh=XVWfsIAgGX9Xd1n8zXWGc6IgbtmhQvC36aepBIb8Tf8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Obqlj1vUZy9ivG+UKv6Q+bORVXphwwK6fL7vthEee3SUMQK6m7CftPGniJHG/Ss6a4pxPeX+khjy+jfllw7TM8ptWfzxzIYH1AKpXV8vZnRD7jpf2irh3zd26udBN6vBySwGZkXEiC+kCjNBCqBjKdD12xDQ/TMq+E7Jr7y7imQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfCg2cKT; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfCg2cKT"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c999f162c9aso7753732a12.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 22:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784699201; x=1785304001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPJSl7du6t+JICWFEnlJMKsprDG3NXTVNkQiPLiNnnI=;
        b=RfCg2cKT6/4wqTihzEB/jtxzUNqBSvgL1T5F5qi+cJCU7iB0ARbZqQv2tTclMuBT/d
         3zEI0HLKwGZ3uZ38Ma+SEMJxugoNwM85UxfW03dgLY5GP03/jmvH0Mu6YSZqAKZDdHcu
         Q8wIT1gDvS0vg7y6gIT8Ue/OazyBiGzVYPvz0vOIOPfLegBPDlWPE3VlsB1jpGwxQSih
         lAUK4r0zAtKM64PkI5+o6ubkO63oAFETx3YZ7fneG+q+bOpHr6lJHM+PBRarPp077Kl7
         r0abLHkAMTmA0mpant95RXNbM5H04CUFXrDd/6S8fHEAgtklZp+5Tpz6sDM+yrTOwPQX
         28uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784699201; x=1785304001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gPJSl7du6t+JICWFEnlJMKsprDG3NXTVNkQiPLiNnnI=;
        b=DcjEmco9ZQ5GCaxyCWCH52Zjct6lIYnUi/pUc66Z4QXm1c8pFfBIySOxMfEK6rBeQl
         fbvl2JLRw9UJaEUXBsoZ6wTT5O2J5FpEutRJ+EPkyiAEVOtYTeFk5mS4OOAxQ2YZGICd
         3MjcpGUyp9la4xSvKYn2XbqwfrqpvDfBj+ghK6Hual/EsaPy9uNaceLfoFypmpRJ/5yw
         d1/B6l/t/+XpcJHIHcTMIEaWobAYseFKZfxVMT0hp/UuLUifna+auBxHrwABFbG3mAhR
         sRRpCAh9n7ol6LxAZUF+99ZX7mzCLlJ6j1b1hgYAfr4yFV5iuHaBPDhSI90n1SHpw6OX
         S7vQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEkTtNCnThUhszBHDEhVpXS2ytFsajiT1kWokcghowcKJ51Qo4jeNO+kwr0Q6+uopGeOnfIMfyjvSphg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVcW4ofc/3SUmXhB4xfJ+IPmTg4V/cH9qZhGEUCyW2oReIPSKl
	DmATXhF4LlSPnnuCMI8iKZmwbojc+JaDoinWU68EMh5fSFcz/YWWDetE
X-Gm-Gg: AR+sD12Urpbgokh7KIsbYrqQd2UOJr85RHByu1Q+7Xq88PvXa4B85AsEll16nYVjVB/
	Ukua6ykdHB5hnPAcASclSWxWVFz7aWGT0wHf76B3420ujsWSpV+y1EI8Zcttm8idPDEso4yPp6w
	urmedGz5xWfTHXE5Vzb9/7gd9trPum0oUuCqWt3QwXHqGdVjsNds/AFToFLKqM+gPvOjAlLWsPX
	fESkFbgBDEraiPh4D+CIdRv2imtclUkP2C3PY3D3/qE49LML+VSkuehaUqYfldo+jkaaiZ3F532
	OLWZfQ0QDe+D3kvZQ7xWIBpg9ADWqC1B4eFDbTF2/drbfxVu39+eBBaFHWXqvdZMH20WhNO1HCm
	aTll7H37D6BtbW8rrdO0DdqrCrDNlMyzcQdc8ZGsWhVU4sWiMdvmivqvBeTBQ5uXqnplXSLlaHn
	h2cwnForAwDUnlg8SB
X-Received: by 2002:a05:6300:95:b0:3a2:f7bd:a9a5 with SMTP id adf61e73a8af0-3c3ad95b577mr22524251637.38.1784699200774;
        Tue, 21 Jul 2026 22:46:40 -0700 (PDT)
Received: from UbuntuOS.. ([2409:4080:9090:9e2f:1d63:54d5:537b:d849])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a8421sm2501696c88.10.2026.07.21.22.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 22:46:40 -0700 (PDT)
From: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
To: andriy.shevchenko@intel.com
Cc: hverkuil-cisco@xs4all.nl,
	mchehab@kernel.org,
	sakari.ailios@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Subject: [PATCH v5 1/2] staging: media: atomisp: Remove pad_w and pad_h module parameters
Date: Wed, 22 Jul 2026 11:16:14 +0530
Message-Id: <20260722054615.21492-2-prajvalchaudhari733@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722054615.21492-1-prajvalchaudhari733@gmail.com>
References: <YOUR_ANDY_EMAIL_MESSAGE_ID_HERE>
 <20260722054615.21492-1-prajvalchaudhari733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the 'pad_w' and 'pad_h' module parameters to prevent userspace
from overriding internal ISP hardware padding boundaries. Convert them
into internal driver constants instead.

Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_common.h | 4 ++--
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 8 ++------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_common.h b/drivers/staging/media/atomisp/pci/atomisp_common.h
index a2462fc306fb..7c6c0124ff72 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_common.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_common.h
@@ -22,8 +22,8 @@
 
 extern int dbg_level;
 extern int dbg_func;
-extern int pad_w;
-extern int pad_h;
+extern const int pad_w;
+extern const int pad_h;
 
 /* Minimum padding requirements for ISP2400 (BYT) */
 #define ISP2400_MIN_PAD_W		12
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397409..d117fea2860c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -64,13 +64,9 @@ MODULE_PARM_DESC(dbg_func,
  * output res, and isp output res. however since we do not have this yet,
  * the chosen solution is the next best thing.
  */
-int pad_w = 16;
-module_param(pad_w, int, 0644);
-MODULE_PARM_DESC(pad_w, "extra data for ISP processing");
+const int pad_w = 16;
 
-int pad_h = 16;
-module_param(pad_h, int, 0644);
-MODULE_PARM_DESC(pad_h, "extra data for ISP processing");
+const int pad_h = 16;
 
 /*
  * FIXME: this is a hack to make easier to support ISP2401 variant.
-- 
2.34.1

