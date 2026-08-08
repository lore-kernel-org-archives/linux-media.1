Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DB734CDD
	for <linux-media@vger.kernel.org>; Sat,  8 Aug 2026 09:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786180211; cv=none; b=eF4paFG63v6ppy5yfB5BnBa9BLbzZGN48T4sTImbneT9gO7Zh8QXWAbCMIn78YBJbGFumYZyJfXM90mjA/Fbi5Np0qnpFSoJ6uAwqH0EqTLTA4a+d/F5qAofY+l6yXsk/k0Ic8cVnm4oG6H0vJmzG61/M5l6tLrgMyuDJ4Cua44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786180211; c=relaxed/simple;
	bh=k/cWIdRMsW/LhHreJLBuB1Bs7FEShufRq6kvyp8vZXY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fQP052+uxGCJf9yhf0p5kiKRpqQiYEev3J8YMO3EG9kL0jRCxDkVSYVlak1h4JLzKPBOjwSs0mKnnJ77O2jJFBZO1QmYoreAKTBQ231Ry8ORA4M0V8pMQVGKn8ZXWPckt25ckMXUVtpSNw59QS05zjgm7cMZxDunyXF3WJk2goQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZhHZwNC; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZhHZwNC"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so199406a12.0
        for <linux-media@vger.kernel.org>; Sat, 08 Aug 2026 02:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786180209; x=1786785009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+D9dBeaqP6iptq9GitZZjO0xaBa9h14yN9QuWGSamj0=;
        b=FZhHZwNCVymYEg1uNqvL3iCz2GwkVSs++Qiyb0cq6mP7kY66E0fuEx+Y97sDS9HwYx
         DkJM/ViaFcab/rBJ2318MhFwFZw4mMrzAxXB7tTd05RRPgrQgpnW2kqDsLEjeukz+TXw
         5H67zWk8iF2bokY1k7/70SEoIdZLatVcW4oRzYkXS9/qHM/NYJnaGbAG3ZJdVFSyH7X7
         Dnn8EQOnqpm76IWqbW5nmMtiV0S1Dj57JUhnwJzcziG0C5ewQRY6ldWPLiOkPWBR3DvP
         1h5h7i8KpGCGcRn1jMv8FhGYJTmLxVy/fOG+ImcZDVvfM6vhhtGlYhm9uwOhSdaaqDic
         J6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786180209; x=1786785009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+D9dBeaqP6iptq9GitZZjO0xaBa9h14yN9QuWGSamj0=;
        b=FEJ5RjNXSt2NBjuwQx2qlfj6esRZGr20UcuzA1NH323l8SRAnYvLnHhCLpzI9B6rE/
         LsNzuuSiN4yJPv5SDJFUnFaxTamVlslXI1pVB1n18PcPKUf+NHQpngAc3dC7zLyPh6Mn
         jj5Xc2WEQu1+NrK4la8iv5ofkJPMTKktwzyIsqc7u6ZZvYoQH71mJLbA9/e89/bVGyUb
         QysB10EOXkKA5i5bMO8fvhY5F7HvYhWq5KLqhbu5Zb/vhaGWgWc8i9ccncADKl5wVCnt
         lbk5uCjWoJUqVFTveDQq+gIfVuj8KVEm6rsIjBAHYnAjlndWxoXtC8igZ2a92Dg5+B+K
         aTHw==
X-Forwarded-Encrypted: i=1; AHgh+RoHyC03NE90l6fofWJVBhGB4iijJ/4hfId8UWzq6YfElINj3CJnLbS03PrvjPjOi7v0jtAAocnbEG3cwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaEoo8GVvcVuervixzyhkRRBGKJiZH/7kQLBl5U4C1yN0cRSHI
	JufkTM1O67fJZTohACJSd7Oxk/F+fhnbLuCMZxact3ir65hPwZEHPJS5
X-Gm-Gg: AR+sD11o0j1wJjWFmoGyC4sFIhGvVoWU6pm9t3mzsjV+fLhzfyXPkKbftuXekn+3jS6
	WMYpBn4DArPl9NPlZW/Zuaom6jJ1CC85ZtPmqVuqwuk2mpRk2syn4av1NeP3vvQy2KSwNiUopkh
	urfZATdB+et6QetAyoo1NGTlu7IsWCM1JXZhFUYrix7jCZYWcRBf8YomRxHXPtBmj5YphkpAAQ+
	+LJ+fzeXwQpJ4nqUrEMBj8NEzzpxvWEo7lpwDCe0iBFom3t8UG3nwPdy0Rzbr946tC/Zxa33oHo
	mMnj2SslO1FxME4/GDbn3czjbsr/mKFr/xTDidr0oGLcm6UTsh3eC4pBy3zQ5uNTpGaD1wtMGH4
	NzL6m0eDImGDEVmmAScA6uWN7VVnjZJnOqKVKy0Kcvifbji5R437ytntkYIE9c4y+aF0XzK/GsU
	c/oKsoSZaeSLhm/fYizaVaSwN06RA+dg59ecgDVhKhf8+FkGMJF5LoqsCkKWHz1rCBbxKh1MZHA
	bAyxg==
X-Received: by 2002:a05:6a21:498b:b0:3cb:9bae:9262 with SMTP id adf61e73a8af0-3cb9bae95a7mr22142838637.37.1786180209252;
        Sat, 08 Aug 2026 02:10:09 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec29672sm17146613eec.29.2026.08.08.02.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:10:08 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: intel/ipu6: fix async notifier cleanup leak on parse error
Date: Sat,  8 Aug 2026 16:10:02 +0700
Message-Id: <20260808091002.2684902-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isys_notifier_init() calls v4l2_async_nf_init() and then adds fwnode
remote subdevs in a loop with v4l2_async_nf_add_fwnode_remote(). If an
endpoint parse or add fails partway through the loop, it jumps to
err_parse and returns without calling v4l2_async_nf_cleanup(), leaking
every v4l2_async_connection already added to the notifier's waiting
list.

The register-failure path just below already cleans up correctly, and
the caller only tears the notifier down (isys_notifier_cleanup()) once
isys_notifier_init() has returned success. Clean up the notifier on the
parse error path too.

Fixes: f50c4ca0a820 ("media: intel/ipu6: add the main input system driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index c9cdeb7054d7..24db2763de54 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -761,6 +761,7 @@ static int isys_notifier_init(struct ipu6_isys *isys)
 
 err_parse:
 		fwnode_handle_put(ep);
+		v4l2_async_nf_cleanup(&isys->notifier);
 		return ret;
 	}
 
-- 
2.25.1

