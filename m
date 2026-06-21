Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C303115B135
	for <linux-media@vger.kernel.org>; Sun, 21 Jun 2026 04:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782016499; cv=none; b=Q7xm0D4qknPd/AJW4EowN+ZL7t5KDYeShMITG4RiMiT43UqcIe9SP/6/Kla7GIKPLxA8GBrNIgy0JN3MgB+JztYGPzi3Im1SdiZP7niFz6cX1vFk/zzyqvzX4IuKfLDBBEaRz+SZlUW0o6NjMM3c/VANc0DGlPOcge/LDvJkxp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782016499; c=relaxed/simple;
	bh=nJkwZ2j117c0Z3zPl5Dhlg/EXAbSwaozedbg+/sxW+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JcPuQ4fBOT7L+A68up4PlfjBXdXaNnpf9OKGtT5EpXug2ZA/VQmj66HOeytyv9KQ94gHjAZzWXh0rQcoAgn2/dRzMeKIz9E1KPpYhO/145219TcpdhCNkkaFZx0e5xbooaZE7HvtSScRsx+Wb5qHCTuza0dK5/Bq85ToLM4+nxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgwvxGbo; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgwvxGbo"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8423610ec93so3082423b3a.2
        for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 21:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782016496; x=1782621296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EZhvgXv/PGau/vVplEkRNj2uGEyJ8j257hahknRP+sc=;
        b=OgwvxGbocdOHyDkrOOyTeDCm9ykgdviAswa9nlkAFQ4RHgd4BM3vp+AYg6uacJRBQw
         SQDT/iyTobImI3mNRwTBPkWYL1JRFXrvOzkIakdmgohZpBnu7y/smexSzlzU58LhKTFK
         VkNzOozc4/QG13RxEUY8UGQRQ9NhjSLrp0Zk5i0BU79uybBTqfw4pETcC+/Uv02XaSrT
         eo9x5V+H1Rm4Qp8ZiXfQiZ0eFuBsVChlQQTg0kqrCdcHgtNSjezdqOF4oOEOGh/vsGog
         bwozvBj6kUJGp5aRlQfTYfqYA9zPpsNlsw/86MPXFF1HWlbOW0oMggqarERGpTqeJVHA
         cyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782016496; x=1782621296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZhvgXv/PGau/vVplEkRNj2uGEyJ8j257hahknRP+sc=;
        b=KL5iJutoiGUYDLq2D5Zt2v1SDzq/umJVQlu80a1YN6I5iL0ssxoj3kgYqqKrPTDxHE
         Y8SLCu6t5B0f7tOTERMeVXMBXjlvEVUTFBc3LQ63osY6BtnqRwbbyy2F+rxy0Y6yXKQu
         rU2BwwuvVDbfujqxEDlpHiWeFdMKKNJJ5noy39yfriwcOZBmSAnpdV7XYRM7VGF4xBnG
         RCeW0FRB0FS63DmcSh11iM7oildBWCtVHbarfYcFwyHTYIJyu0cncJ8hRSynlUlPE9tB
         76IIk3hvRYctv0YA23zeR+1TfE1Yd4j1VaDSPSZ9ajCrAwWWSIpzP5C3imNWepD7ncOA
         Uv8A==
X-Forwarded-Encrypted: i=1; AFNElJ/6mSHEGk05ncSi9WO0KukONOtRgsyeUQ4tLKVPPFiTJCrTgqLrsZm8NF1cj8bbLpigEHCqJ/8JTWRBAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylwhlcB/BA5ta+9hw8h6d3bpcUdMbQ5S2TOqYqKxu7Zoa2MNRX
	538eEq8yUcVT4bmuWDVcFGumvHAg1ICtLG9sD5BMfKDuFBLgtuRcLK34
X-Gm-Gg: AfdE7cnHVu435AeDugmT9q0Qq1ZnruUWVxJlOFgXSXFeEX8fscba7CuIrpRU92FqS82
	RaBjZAN7Dd7IlJ8tzbK36h+4Nb06AVymAoAZ7ZQnF/yBkMurXbgZH8KYM8lg1hvyB3SFb68defI
	r/K6tOPnCUm4q9o1s9e9DEafPw2byafz6nR9PfBMg5+1rhhFsQuZ1UB3yB594HikVg82OUeG4Rh
	m7w92TX8XmCeH/fw/b1zIPzNNXd9c4gXoFf4T6UF16Avg+ucsnjuGtFmVAUEQOAVJLc1UVWrE6B
	XSK7ho/DawW8A5mYjJ9NeNW+BPXbIhaiSFTv+k/+yOrgzmCjMItQ2DjTcPDGGQBBmWMsdWb01eA
	8p+B/r+RHcL+r/iOJXPUVxmF3C/4pkrfp8SXs+Z/ONYWzn6yk2e3IWaF6KiuqLmseRs28LuAfJx
	p8rkZ7ZJamZU6e/DlHUw4KXGtRDGrJ4q4RPkJTmeW8cocLzYWm1slh
X-Received: by 2002:a05:6a00:2e23:b0:845:3c47:9159 with SMTP id d2e1a72fcca58-845508e2719mr10476394b3a.45.1782016495956;
        Sat, 20 Jun 2026 21:34:55 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6813bsm3695572b3a.8.2026.06.20.21.34.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 20 Jun 2026 21:34:55 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: hdanton@sina.com,
	syzbot+051024d603432b4ab395@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	Biren Pandya <birenpandya@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: cec: disable delayed work before freeing an interrupted transmit
Date: Sun, 21 Jun 2026 10:04:37 +0530
Message-ID: <20260621043439.52943-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cec_transmit_msg_fh() drops adap->lock to wait for a blocking transmit in
wait_for_completion_killable(). If that wait is interrupted by a signal,
cancel_delayed_work_sync() can run before the CEC kthread arms the reply
timeout via schedule_delayed_work(&data->work) in cec_transmit_done_ts().
The work is then armed after the cancel, and the data is freed with its
delayed_work still pending:

  ODEBUG: free active (active state 0) object: ... hint: cec_wait_timeout

Use disable_delayed_work_sync(): it cancels the work and disables it, so
the later schedule_delayed_work() becomes a no-op and the work cannot be
re-armed. The data is freed right after, so it need not be re-enabled.

Fixes: 490d84f6d73c ("media: cec: forgot to cancel delayed work")
Reported-by: syzbot+051024d603432b4ab395@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=051024d603432b4ab395
Suggested-by: Hillf Danton <hdanton@sina.com>
Cc: stable@vger.kernel.org
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
v2: Use disable_delayed_work_sync() instead of reordering the cancel, and
    name the re-arm path. Suggested by Hillf Danton.
 drivers/media/cec/core/cec-adap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 8f7244ac1d43..acb0b5483bbf 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -965,7 +965,7 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 	 */
 	mutex_unlock(&adap->lock);
 	err = wait_for_completion_killable(&data->c);
-	cancel_delayed_work_sync(&data->work);
+	disable_delayed_work_sync(&data->work);
 	mutex_lock(&adap->lock);
 
 	if (err)
-- 
2.50.1

