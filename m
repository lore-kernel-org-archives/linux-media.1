Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D5B2248B3;
	Tue, 30 Jun 2026 06:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782802662; cv=none; b=a7XjCtaWyk4QdovkpWO607VC8SQriiQzcdzOuoltPJeqrVBuuEFO3APs1Vbaslv+QRtZpML4mX5wNN5P5NLwGXxqZ0THp09ajpbUfPJVZw+biSesc7LKTJaBuU1o/qEqpvIf6vWt6iYEObquZSieeepqBuUh4fcg8tzS6JXUrcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782802662; c=relaxed/simple;
	bh=k1oIdxXGm07NyQ4WD6knLoCKYJk1tg4W7oJIC7mqz2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h0Pcy1gnr1rPUgSS5p/+yLCFj2qYH9I00Rfh3apgyeSG6VmBZKT+NBieixTCDXY7RCcWtPFnwxQg3UiIKUqdE1XFzxMTaXFEAzezEtq2Afm74jyE20yFYA8fZpqjbRtYeKqZhQAi8N4PcRSPDWEJ6wt8yg2upwYJ5YDD1KZq+14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0014-media-cx18-stop-VBI-start-code-scan-before-short-tail.eml (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABnw9bhaENqsFEjFg--.8191S2;
	Tue, 30 Jun 2026 14:57:38 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] media: cx18: stop VBI start-code scan before short tail
Date: Tue, 30 Jun 2026 14:56:36 +0800
Message-ID: <2026063007035519.3-ccfa108-0014-media-cx18-stop-VBI-start-c-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABnw9bhaENqsFEjFg--.8191S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw47Zry3GFy5XrW7CFW5trb_yoWfKFc_ur
	9rZrZrZrs8ur4q9ry7KryIyrWYvaykW3Z5uFs2yF43JFy8Cw15J34DZFn8GFZxXFsIgFyq
	q34rXa4xAFyDGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbc8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5oGQDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

compress_sliced_buf() scans one byte at a time while testing a four-byte
VBI start code.  The final iterations can read beyond the remaining
buffer tail.

Stop the scan once fewer than four bytes remain.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/media/pci/cx18/cx18-vbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx18/cx18-vbi.c b/drivers/media/pci/cx18/cx18-vbi.c
index 8dc4ce3..3a8430f 100644
--- a/drivers/media/pci/cx18/cx18-vbi.c
+++ b/drivers/media/pci/cx18/cx18-vbi.c
@@ -135,7 +135,7 @@ static u32 compress_sliced_buf(struct cx18 *cx, u8 *buf, u32 size,
 				    : VBI_HBLANK_SAMPLES_50HZ;
 
 	/* find the first valid line */
-	for (i = hdr_size, buf += hdr_size; i < size; i++, buf++) {
+	for (i = hdr_size, buf += hdr_size; i + 3 < size; i++, buf++) {
 		if (buf[0] == 0xff && !buf[1] && !buf[2] &&
 		    (buf[3] == sliced_vbi_eav_rp[0] ||
 		     buf[3] == sliced_vbi_eav_rp[1]))

