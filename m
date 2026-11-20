Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196432;
	b=NXPKC+xHqiy9jHyOcniMkxEJtaIUhldYJs5p1Gk5kTIrLlmrMIxGhKkzRLyT+2wZCjvG
	 TD1FVrUg0UKlBHaiN7yg8quAzvPrSbPietKrDfmAvILZ1YqlcDEcMYU1Zas2EaqKSGff8
	 YuA0ZrILxeQ7ugKeIiZHTNMXTEO54MQPmNcHnn5O8WotzpEQC+7zau7fY1Eksji0109FB
	 6bdFhwGMkGKNMygKeVKF2siaAGBmn8VFvmF2ERpdOB17uEVKu2gVe+spCFaICDqSXC5tu
	 i4mxv4x1tSBtE+Y18UxCXOnc4g0ABGALKq2fWv9GH+X1lDtvPTJh+nkxZSvqlbDyakQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fe0PplXkfJEjGF1pRChOr9FUjudOYaWFATaaoi8fy8c=;
	b=de5y+sTg4DYCPbtomHxvddi7c/KIaGzRKxBmmCJ5VneR1B6qHkNXTpaYRLDOKTkADYXw
	 fE38krS5xnlbEP3zOkpHWBCPPJSWvFv+CMfTXbsRsx7+a9O0L0YvNZQX5nNVumcy+vLHK
	 t37vEPmSg+lpsQf0Ri4BCDKue5rdLxb9Gknt/fTeUzkDJKyrlNbAwF3nd78AlwB/WkhLq
	 UZJxGqFKHCj8reONXkAZbjX7FjXGxYOWHPRky7TV5k9FuaBxXwhXCuS6e4rdZx9fBmaXi
	 jPpu86tFfW43jikrQjJexXTDf1+zXL2HXFFzZAjZTSEtitzsoyT07h4AJQwQkXjAdIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sNKmrKTU;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD250606A330
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 17:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD250606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sNKmrKTU
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55ade1de0b4so13449191cf.3
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 09:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196428; x=1795801228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fe0PplXkfJEjGF1pRChOr9FUjudOYaWFATaaoi8fy8c=;
        b=sNKmrKTUQ+N/e8JWkw8tQEKL0TzMegwf3BapIpPt8Sz0nA4Xcx5K6WXIWVmuU2ZAMu
         Ec2of/rPL6lg3oAKglcGb6H51PtIkHkEPuwWe1vNTuZNycrogWI3r5NFC9PbHhZVhrvX
         b1pzXgBYMXA5KE8Gy28Ofs9vIABDkefs24m0Wr2lGg7+F1JEdRUt8Y41sBaq6E0yPRVI
         BEgb029AAEWFrcmUkmZfovrq8xnjbpdBu9GDPWxess9y4swJoSL+xwT+ComaiJQZWQ/t
         3dQMFVPYtQdzWal5YKkSbOrYVQWETQxE1OeSxE6vsKDiD2iUUJpuYvdlPdgDqngBQf35
         AQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196428; x=1795801228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fe0PplXkfJEjGF1pRChOr9FUjudOYaWFATaaoi8fy8c=;
        b=Re7MoTDmJ3aF+qOfEz4Xlhiujw9BGJeGkJZfPboEVabTM7A3jGr6jLZ/RNihr1KIN5
         FtuzujgQZTzqNOpGtN7mVvm1jWLrYAEU9oMsdoqObncyjvWMSc3CXbMScRCjJVK7RSbf
         iKhl4EgsM0hY+oI76X2pc4hcOEXzETVBY2ME3Dx1f/EN621fPxggxGXb3FWASC9Zwgpk
         9YxtKO736eoBafjWph9p4P9OE92AY/TN5MQECwp+v6IEqhMef3aYH9z7QsyB6qjP+pda
         4T3h+ycAB3ozwSR6XW6raWjofZDx0GNJDA9h5uOCUmlSqUaicW8O6UMD6WYyydIiNhah
         cvsA==
X-Forwarded-Encrypted: i=1; AL+hErEj98mvm49pLcOtGr1B/M9FHgxW1fw69kyZfHpxHp78Xii10dXlDQP4DZ6REuMkmaw7HO2A6nxh0x0Psg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/eJjTnZl+5iADQMD+CbqtHgNDidW/LUHdTPcHhozc+rBrYbaCc
	V1TpZurp5/6Ijrv5mVi8BbROHtdEtpDKXA9jBDzEYdUNB6uOuncQHko1
X-Gm-Gg: AYBFou15TcEkJc/ZtFEYNPVaDJNbQKQ7SQQYPxQKziLBge5MDE+pYkvjSzDGAlmJLma
	FtWLKe5NuatHcMX61fbbDRzZqfvtVJBg/sH/35oCZsjnwuDtHkiMWlg2WUwcgaZ5AsrgVu7JlO4
	e2aB0tYuXfG+LMX+3JvjZYSWu+y26reW1YpYUIeH/H9ekH3l5+rSaY1LjT6UU49nMjsXFY7KL9L
	TBtywp8VBRJNnA9CroVPhOAgK+Hs6/LpnQkuQG+7Oea1wh7tg1m4mudnxXztrs1jTD4HontUvh5
	Of/ROr+ZWeC2t4CsF7urOBTvAMW5kB3ARM0CeoyU99d+dvUuWqG6nK8icX1OnYbR0ijxpwI2bim
	LsuiX1lnMNdAQdURRqEmRc44ZWW/djLNoIlKGZodslDGiXuu8Q5pGjIcuRSCQBIHSOq3c5H37ea
	ASe1imOqOE+JfoZZJGuFzFlZ0ChY7s335SH1LyeXKAecQKvj2D3QGeQS10A5bZvtsSuNUX1AvxT
	8k90QpFOBFZJLUjnLOaKhh4q82CTbipyzNvXNjEWqcZjDsqZEYR9Oc7OPNTZGI+e2uD+fEmdCZe
	Pd+0YC5EkzEe8r+G6M3cGBgB0q5LNi1ppF7rIgwAED7Pt803MWSk154QH/NYg8g4+1Ai9fyGEUH
	fHRxBcjREHmvFi66PRszsl4zZ/IciLJkf+OyLYqDaW86O4CJx7a+VgebrikHpE8OXDr/lRaTyr3
	w6NroVeo073+9K3Vrxr3lvKZBeJgilMkVnqq05Kw/Sah3LuTnRPAMHp6qXTuD85Xk1sy9vNPxQp
	mG8hY03k+09tObGKlAqUaCLYVcIkCmjkvumhD4zEeqa0g==
X-Received: by 2002:a05:622a:2609:b0:55a:df3b:38d4 with SMTP id d75a77b69052e-55d76b5b9b8mr68312731cf.75.1795196427747;
        Fri, 20 Nov 2026 09:40:27 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:d420:4621:169f:8773])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm28110831cf.28.2026.11.20.09.40.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:40:27 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Allan Siriani <allan@fatecpompeia.edu.br>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] media: qcom: camss: Map each CSID to the VFE it feeds
Date: Fri, 20 Nov 2026 12:40:25 -0500
Message-ID: <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795196107.git.jesse.casco@gmail.com>
References: <cover.1795196107.git.jesse.casco@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CAMSS assumes that CSID n feeds VFE n: csid_set_power() powers the VFE
with the CSID's index through parent_dev_ops, camss_buf_done() is passed
a CSID index and completes the buffer on the VFE of that index, and
camss_reg_update() is passed a VFE index and updates the CSID of that
index.

That holds as long as a SoC has the same number of full CSIDs and full
VFEs, with the lite blocks after them. X1E80100 has three full CSIDs but
only two full VFEs:

  CSID:  0, 1, 2, LITE0 (3), LITE1 (4)
  VFE:   0, 1, LITE0 (2), LITE1 (3)

so CSID2 powers VFE_LITE0, CSID_LITE0 powers VFE_LITE1, and CSID_LITE1
fails to stream with "Failed to power up pipeline: -22" because there is
no VFE 4.

Look the VFE up instead: a full CSID feeds the full VFE with the same
index, and the n-th lite CSID feeds the n-th lite VFE. CSID2 has no VFE.
This gives the same mapping as before on every other SoC.

Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
 drivers/media/platform/qcom/camss/camss.c | 46 ++++++++++++++++++++---
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7d9622097..8020b675c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4629,11 +4629,39 @@ static int camss_read_version(struct camss *camss)
 	return 0;
 }
 
+/*
+ * Return the index of the VFE fed by CSID @csid_id, or -EINVAL if it feeds
+ * none. A full CSID feeds the full VFE with the same index and the n-th lite
+ * CSID feeds the n-th lite VFE. The two only differ when a SoC has more full
+ * CSIDs than full VFEs, as X1E80100 does (three full CSIDs, two full VFEs).
+ */
+static int camss_csid_to_vfe(struct camss *camss, int csid_id)
+{
+	const struct camss_resources *res = camss->res;
+	int i, n = 0;
+
+	if (!res->csid_res[csid_id].csid.is_lite) {
+		if (csid_id < res->vfe_num && !res->vfe_res[csid_id].vfe.is_lite)
+			return csid_id;
+		return -EINVAL;
+	}
+
+	for (i = 0; i < csid_id; i++)
+		n += res->csid_res[i].csid.is_lite;
+
+	for (i = 0; i < res->vfe_num; i++)
+		if (res->vfe_res[i].vfe.is_lite && n-- == 0)
+			return i;
+
+	return -EINVAL;
+}
+
 static int vfe_parent_dev_ops_get(struct camss *camss, int id)
 {
 	int ret = -EINVAL;
 
-	if (id < camss->res->vfe_num) {
+	id = camss_csid_to_vfe(camss, id);
+	if (id >= 0 && id < camss->res->vfe_num) {
 		struct vfe_device *vfe = &camss->vfe[id];
 
 		ret = vfe_get(vfe);
@@ -4644,7 +4672,8 @@ static int vfe_parent_dev_ops_get(struct camss *camss, int id)
 
 static int vfe_parent_dev_ops_put(struct camss *camss, int id)
 {
-	if (id < camss->res->vfe_num) {
+	id = camss_csid_to_vfe(camss, id);
+	if (id >= 0 && id < camss->res->vfe_num) {
 		struct vfe_device *vfe = &camss->vfe[id];
 
 		vfe_put(vfe);
@@ -5043,11 +5072,16 @@ static int camss_link_entities(struct camss *camss)
 void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear)
 {
 	struct csid_device *csid;
+	int i;
 
-	if (hw_id < camss->res->csid_num) {
-		csid = &camss->csid[hw_id];
+	/* hw_id is a VFE index; update the CSID that feeds that VFE */
+	for (i = 0; i < camss->res->csid_num; i++) {
+		if (camss_csid_to_vfe(camss, i) != hw_id)
+			continue;
 
+		csid = &camss->csid[i];
 		csid->res->hw_ops->reg_update(csid, port_id, is_clear);
+		return;
 	}
 }
 
@@ -5055,7 +5089,9 @@ void camss_buf_done(struct camss *camss, int hw_id, int port_id)
 {
 	struct vfe_device *vfe;
 
-	if (hw_id < camss->res->vfe_num) {
+	/* hw_id is a CSID index; complete the buffer on the VFE it feeds */
+	hw_id = camss_csid_to_vfe(camss, hw_id);
+	if (hw_id >= 0 && hw_id < camss->res->vfe_num) {
 		vfe = &camss->vfe[hw_id];
 
 		vfe->res->hw_ops->vfe_buf_done(vfe, port_id);
-- 
2.56.1

