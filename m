Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794287101;
	b=2mVfUAmIpvW5C/eV+zJWFyVlL3aqXbhgAE6DKfFH2IzsPJkxC4JKovNYih6mFVrgTONG
	 UcXWKf8YkODkURpjun4gLtchOF8FNW0shsB6eyS5Kt0iJFTj2qwMdEZRv/gqlXh6f8pwK
	 X4hBdknFnv4fWOpTt4BuvNG1j58MOT27Wh3S525Q9XQo/v3UPs6KYjNMkGRqjlRFO8ihw
	 QVm3TtL4TCljjbLzl6GsHxDxIAXTKxZqS1hoTaLV6xa3wTzLOp+7sMCVfXiV3SDuEUgkc
	 6kN4/l126ldqAx4pf4HU24dhBN6ZUfnnwec60ctHyQ7g+iuV1vM1XnY6D/37K4HezZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794287101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x28Xh8Kl636Xj0Syxm9iILHuaCS0bk0qyS/PVv+3B/0=;
	b=CqgBh812+eN4XwOuE6DENjfV0sQRUnMgz5ahJffHeW+hWreZw3ML/AgwRlyZCjDwV8D1
	 VmBVEOx4602jCjPSHrSR7qIeUsO/eT8ZWypSzLJjPNCY5wXWHSzl2Euf1itItYe7TNxQ8
	 i7mmmXLi5lFg1rFKrty5bWnuYD3rzoAS4qkcRly1ziUZn2rrBLKbuV+rpC8cMzeegCeGO
	 Pdj6whfiIZCE+h89I7ToHtwOaUDffI1TlksjaXrxmJxE/QPdcQ30K52ncPMAzh4V1osDI
	 VbCDHu4q7sj1rSICBzsONm0FcK5lE5Qp5e1k8feEqUk87StJ0hgDqR/rS8EcHO9wDTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JSmG0iTw;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9AD606D6B8
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 05:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA9AD606D6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JSmG0iTw
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37000e7234bso2570819eec.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 21:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794287100; x=1794891900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x28Xh8Kl636Xj0Syxm9iILHuaCS0bk0qyS/PVv+3B/0=;
        b=JSmG0iTw+XJl0Z2LL+TIXz9lpLOf9odVdw8J0XbHmv2HQVNCLjWCK7cIEbTCztUoXL
         Qdz7r48OnFyqpDdUTDxMAktGekc4qHvmD0G36pK5uW77jOboolVDKKzq7bPTEASrzX2V
         hQm18XozQiUWui4yslZNtvEiFRLeJ8UObSOQnGApg42Ei742cCvhaATRLxdU/zHgTglI
         L46/KhlrocCy5+p75pN+hXfhQnmDg4u8DlvpU37NYTEK5ggD0y7iwJb2gN/s4X3FpRaw
         R2VwcAjh3Mr3PK/NuuQr1C0GwH9TttE50vrksXH4WnypNfJ9BKLOQShwrb+wF6QnmuiW
         0JRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794287100; x=1794891900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x28Xh8Kl636Xj0Syxm9iILHuaCS0bk0qyS/PVv+3B/0=;
        b=H35XWDY5PcmBzH/5W1T0++QyqODZjmJF/O8G9r5Y8ICDcu08H4/wrk21PLeOB7DnlQ
         xy+RD5H0eP202DsiEXqlUppM6s0e4OACjV/x2nXqKiyHjkaDEzjLYHDHrAKuRX/oqnx8
         4zzUOteuVHzMICAGovvcLnGlY+mlIID/P9ZRobl8sYFSnWXiaUEzH1+J2UITxqLjMvdl
         EKroPlvDHBDzlJ+u+9NIZLlE21zxg0WqWGGc2SDAQz5UV8IU9loERzSYJjJWVfxRRuvK
         b52O14Tsvvx0yXPC2tFi9JouGsZJzFNxvWGCxKQjBoJ8KOmNZlLoNdmXUTcCzwyiWfJF
         wz4w==
X-Forwarded-Encrypted: i=1; AL+hErHOigcGaTEGPu+gpEuzU5h/4Co1pcmtQy2o3AXzvDLvzB6r4DP5TQi/wjuZ15L9SLDbxnL5diZhehFizQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8K9ssCT68oUZX7Z3/TySQdw8FRGhgR0iCdkTiBCDM0YQTTXTYe
	uwjyVzsmrq+OQJknAD8/ckcmuVy0o4mrKp213q+9ft0vya4EDyB21Zfh
X-Gm-Gg: AYBFou0TfL/XhAC4nbfZaHZFmy60iwsLI3lBrrfqt92+Pa/U6w096ZZvC5JeKbmvDMA
	SIrMjtKh/pPxwR+ZxrBqN626iqz4hmW6FTmzQdxkW9zTL4H5X9G3/dYRC2D17aIGHgXds/r+DmM
	HKhRPNm0pFDw65KdJp4NCFz4E+Dlbj0BHhupBy8Us0biJ49PrQ3TV/CFhcLEWHYmKnoAItjrm60
	JHKZczdfPg1TLEmS3M7LjkQh8QGvHXZpELYTmbjIgDfmPiBmRZB+FgfjhauIJHIyB73h4+H1qFY
	OmpDoySImV53fOFcQhIm50yAecw62D/YBfDpl/oM79kuwODwBB4IqqexJj2jHXXH8CC5xz0q355
	Z1d/kynzTRB9tlHiV6PkV9xR7zL27pUZeZ0Ibp+9EbmJPLp4FItG5kO+XgRRyxQuyIOU/vzHdtc
	r+mifaOYq8PcsOer/8hXIyGRmAiHMpQBgllHZDO9Jup5w9vg1P0cx+4i8MAr/RVYU9pNoc79ePR
	w9lwO0OYOXdmi9G9i4EBFtK7gg+dzM7ZumJX1L056wtWA+6gYGlunN+BTLe5JH6H+bE/o+3z/1u
	3juqMPhKh9yfjx/amQxVwyBJb4f4B5VFbF7RMY6Xfi/BvMtr18go3VDQLXVdZoaMzkDYKv0W6rL
	3RGX8MCR8Jsot/m0ln9xqzhWbtBBGvLmbEx7L1s8=
X-Received: by 2002:a05:7301:4d14:b0:375:4f3e:643d with SMTP id 5a478bee46e88-3754f3e6572mr1368404eec.27.1794287099742;
        Mon, 09 Nov 2026 21:04:59 -0800 (PST)
Received: from localhost.localdomain ([203.92.58.30])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm6550235eec.23.2026.11.09.21.04.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 21:04:58 -0800 (PST)
From: Shivani Patel <patelshivani2283@gmail.com>
To: outreachy@lists.linux.dev,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Shivani Patel <patelshivani2283@gmail.com>
Subject: [PATCH] staging: media: atomisp: Fix leading space indentation
Date: Tue, 10 Nov 2026 10:34:48 +0530
Message-ID: <20261110050448.69521-1-patelshivani2283@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Replace spaces at the beginning of the line with a tab in
atomisp_find_in_fmt_conv_by_atomisp_in_fmt() function parameter list
to conform to the Linux kernel coding style.

Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index bdd2d9b18..773fcea56 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -96,7 +96,7 @@ const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv(u32 code)
 }
 
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_by_atomisp_in_fmt(
-    enum atomisp_input_format atomisp_in_fmt)
+	enum atomisp_input_format atomisp_in_fmt)
 {
 	int i;
 
-- 
2.50.1 (Apple Git-155)

