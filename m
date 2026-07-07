Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1181DDC33
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 07:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410038; cv=none; b=Fp4ALjNxhGzw86HJJ0QosFaYtNSRkQnrvDoeT4Xw1cKkoXHk7AS2YkOQ8rV0lZle9J5ycwL5UjFyBA+zTSMEfi+gHPeLqEN07lYGmQKQHq4D6hm9tzn9R/QQEs0+RlCC664MCHUrl6YG/eyK0Ew4CiQHlMaGyUTLqfyr4xy/iqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410038; c=relaxed/simple;
	bh=DSEChP9kAsmk2HrXfSdbcWaNkWfX3idepBBcxxyGuF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MMaKjm6h4/nEyxNiFlYx4xyw/AQxxKAVpg14dTr6Lsd3xfEmcJNnl9igN4URZd8OXyx67yvReCqBNXZ2jFiuelVi5bkxj3N5RYCyVzoSg7un7ibajIn2TDWbizhZOLuNt8ukCLP3//Tgv+3r0YFzq74U/+zbYrdNhG5iXRbXQvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rw0C2aCe; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rw0C2aCe"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15b509c323so16943466b.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 00:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410036; x=1784014836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K6AeqTPAcZ4JrA+Qd1cNlOBTaQ+fwvnS/cXYGctMis0=;
        b=Rw0C2aCeSBiGyroqDJrlMmjF9ZXivPPyoQVktaHQlqnl7sackN86lUT/z/vS0A5zDu
         Yty4If0jGhx/MsBC1RAKgVulSbYP49MdOAGYZgCVQOykSOLG2iJ9w7XtwB8a0Kq4HiD1
         AJ13h4QWE/UAMhD747C+6KzjsCFfbWYxwhmQzDLqOx4G5Tgpd3z4xhTtPD5Ume6ozbw6
         7GCzISdeDSPIi78mjekay4tCvSd+gmbfbZ/hROtftuGLMwPNp5Nwk3zjyOWdEvWUlUUu
         bkYPBEhN+hwQSIydDXuk+niLxO3yv7RaCtZ2zGZH41l1OaoyQOADfcEnPvfxwflc2e44
         oT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410036; x=1784014836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6AeqTPAcZ4JrA+Qd1cNlOBTaQ+fwvnS/cXYGctMis0=;
        b=spdd1uKnZnOyqOZoWl3c1Z7f3BBS+bxXI6oQInG/gL0pI7SvZFAIfaRMJgbqLH9t8f
         /agUkUAKR7Ky/SRy/CCfJ+X8EfiVeIHdCzoSES28WTwraFCwMA2QgoTMmaKGVGUI4ET6
         LKU1ozffUvVByJBUt93CZav+MqmaGNFHWvcnRbwnHoNS6UGAAGIEAae9vFwxsG7jFpBh
         s9ATJwxBNL3KVscaM6BwC9rH9OWRSg449GBGKXkSWYOP2CtGoh+rkA/jYk81dHEzLj6+
         jFtZhuH720XGaIGcjJqIZX+2IbkzXRbhipGGDIyQ+nZH6WJrBtZFCDMvlH6pKAZV1udW
         CvzA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2qonu4do7U/p1rM8sqa14ZclIxqYg9lLtIXyzrEL8MqmdinTMo1DR+LtwFO/hCLd9RZ0DHvMHJG+Bww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs91cifXjmSGJS6XEa3rOxJaThZbQ8geBIHaaacQaOHCu69qv/
	nEPmVNJeqrRlwWArEawrVC/+QFeaxh3Tk0R8Y4WuaQenD8LAn9j6UmPx
X-Gm-Gg: AfdE7cnuJZPmpuwb0b5zCXJm4sHC88RZxEZ6F/sHLUaWr3SuxkqqGeaTztTUE9MOCIh
	AF66a0zyNSiuIYRL/QwCc/26d/41+hk58upvIT34F6NOeQjyoHgHe6JZnwzF2X8PMUTi0S/lWUC
	9sXLfy61zsSnGRKeH0zT7BGWQD0kfrGQA4deexsJll1/2v3kooY/p3I0AuMR7xR5lTVGSv5mnuD
	4fzD3lQ7cElB3sLzdJnamZ7mjmp/GPxDqSKVuAGS7NCe+eFfr6dKALO5Tyy35NCRCa8Dw7HBcfe
	qa6pFN7VBCcrJRdvMQ6aTWKKpDH9GT4UFAOTW+UG40Yq6ALI1TGAWa3lKDjfJa6UlVagH6E+N10
	gnYYZiHTnSEb5aHOW/TC+0E4R5sUJaS2kR1guimFBQlpJH0g5FkrTyfVe64NzxStDm5SONNskm/
	yz0KAcPQ==
X-Received: by 2002:a17:907:e14e:10b0:c12:696a:b217 with SMTP id a640c23a62f3a-c15a6823e54mr192470966b.25.1783410035532;
        Tue, 07 Jul 2026 00:40:35 -0700 (PDT)
Received: from fedora ([156.203.68.153])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad882342sm72125866b.28.2026.07.07.00.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:40:35 -0700 (PDT)
From: Ziad Ali <zalshemy9@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ziad Ali <zalshemy9@gmail.com>
Subject: [PATCH] staging: atomisp: fix typo in atomisp_tables.h
Date: Tue,  7 Jul 2026 10:40:20 +0300
Message-ID: <20260707074020.12332-1-zalshemy9@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ziad Ali <zalshemy9@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_tables.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_tables.h b/drivers/staging/media/atomisp/pci/atomisp_tables.h
index 33e6079aa..59730ce32 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_tables.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_tables.h
@@ -93,7 +93,7 @@ static struct ia_css_macc_table skin_high_macc_table = {
 	}
 };
 
-/*Blue enhencement image effect table*/
+/*Blue enhancement image effect table*/
 static struct ia_css_macc_table blue_macc_table = {
 	.data = {
 		9728, -3072, 0, 8192,
@@ -115,7 +115,7 @@ static struct ia_css_macc_table blue_macc_table = {
 	}
 };
 
-/*Green enhencement image effect table*/
+/*Green enhancement image effect table*/
 static struct ia_css_macc_table green_macc_table = {
 	.data = {
 		8192, 0, 0, 8192,
-- 
2.55.0

