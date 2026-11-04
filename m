Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807844;
	b=M12OgxQsobI1BflAceCv/hDjsjuZEW91NF3Z+tDP8W/X0cqnkEynlHM+OJXrbfLFMgI4
	 v4anXKhRDR0NQUln4fV4reuIQK5qNUCEzBVB7J45CKcOo81QZ+iu/GubYQKIx8qN2j9TO
	 2o9/PXjRHZ0nMU/J6Y21xb9s4VMVl5dC1FYizO6Rph7JSySzM8GLJ9UvgUOTVumrnyFV5
	 vJ9GRjDo+xLMjufU11GQ0xZwoh269TpHU42SOo1tSPI3vSQBgC6YqzXYwPtxBJunQ5jIc
	 lgGthvl4TKnyKMROs0iFs+J63MKkuku06NwBXhz2uSILB/Jh+PC2wb/i/GS/UUMvAsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807844;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GMH+IYFOkHu9owDB4J87ITnKG2ckXxcQ02YHPeiqImY=;
	b=X6ufY83g4CCFtol3r4HhPB/s9SDbu40P+gRYB37aNEX9fFA8pMcjdwrjzLrTj7Sp5h62
	 nwKgiYrt9zB4voLSmJcFmXSAozOeSzQmfCwdhGVlCfFUD6Gxj4sFAuFKbsivU0l/Lv2wR
	 DGAGuLdecAKltfUz8qYkBZioROSGSVCMKf1E6dvYfylyfFj7WQh7lQiMyS2Whh+k3tDZW
	 LT5RwDLA5PJ2IHHBISaOPhWQ4lD83ImibYOZZGLIffRPYMRstWYfb3lqoqoKxQ24T5m4b
	 5lqmW+A6PvbCHsVf6ijgshidpLmcx2ln1eXjXWs1xWXw4LzmMs0vpxhtI6F1uO3GANA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQjWdZjM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CCE608360A
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 15:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQjWdZjM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8134B1F00A1A;
	Wed,  4 Nov 2026 15:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793807844;
	bh=GMH+IYFOkHu9owDB4J87ITnKG2ckXxcQ02YHPeiqImY=;
	h=From:To:Cc:Subject:Date;
	b=WQjWdZjM83oWVfhtehEVp2uluY9+34zbrMm0WkZIsLjR9coag/9NuqzT4UifZnoyj
	 mzcb5gCXS4jiIjgD57HHVnLY0Xg5XXKK+tRb8H7g3rqF4QM08T3wYGTTW6GxOXpe63
	 QaT0DbcPKKhdwhz7WAY/S73/NXTfWcJwBhu38rzzhTQfVtwWV5WPL8xzMdVPV82UFS
	 XCA6KncowsS5uIzcBU4NDDmpI16PYW2bVRRdG+7uaife1oWn4/qcuWvDjRrWxGxF0a
	 phKEqIA9ixWZCdu+EU8sYaas+20rJqTvPzqcpqeuAl+lZgKcBtsO1AH9GmzJa2ntxj
	 acrTJqKLoGs7w==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: [yavta] [PATCH] COPYING.GPL: Fix license text to match gnu.org
Date: Wed,  4 Nov 2026 16:56:13 +0100
Message-ID: <20261104155613.764306-1-mkorpershoek@kernel.org>
X-Mailer: git-send-email 2.56.0
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

When packing this for fedora, rpmlint complains about the license:

  yavta.x86_64: E: incorrect-fsf-address /usr/share/licenses/yavta/COPYING.GPL

Update the license file with the new address. This has been generated
with the following command:

$ wget https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt \
       -O COPYING.GPL

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 COPYING.GPL | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/COPYING.GPL b/COPYING.GPL
index d511905c1647..9efa6fbc9628 100644
--- a/COPYING.GPL
+++ b/COPYING.GPL
@@ -1,12 +1,12 @@
-		    GNU GENERAL PUBLIC LICENSE
-		       Version 2, June 1991
+                    GNU GENERAL PUBLIC LICENSE
+                       Version 2, June 1991
 
  Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
- 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ <https://fsf.org/>
  Everyone is permitted to copy and distribute verbatim copies
  of this license document, but changing it is not allowed.
 
-			    Preamble
+                            Preamble
 
   The licenses for most software are designed to take away your
 freedom to share and change it.  By contrast, the GNU General Public
@@ -56,7 +56,7 @@ patent must be licensed for everyone's free use or not licensed at all.
   The precise terms and conditions for copying, distribution and
 modification follow.
 
-		    GNU GENERAL PUBLIC LICENSE
+                    GNU GENERAL PUBLIC LICENSE
    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
 
   0. This License applies to any program or other work which contains
@@ -255,7 +255,7 @@ make exceptions for this.  Our decision will be guided by the two goals
 of preserving the free status of all derivatives of our free software and
 of promoting the sharing and reuse of software generally.
 
-			    NO WARRANTY
+                            NO WARRANTY
 
   11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
 FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
@@ -277,9 +277,9 @@ YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
 PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGES.
 
-		     END OF TERMS AND CONDITIONS
+                     END OF TERMS AND CONDITIONS
 
-	    How to Apply These Terms to Your New Programs
+            How to Apply These Terms to Your New Programs
 
   If you develop a new program, and you want it to be of the greatest
 possible use to the public, the best way to achieve this is to make it
@@ -304,8 +304,7 @@ the "copyright" line and a pointer to where the full notice is found.
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License along
-    with this program; if not, write to the Free Software Foundation, Inc.,
-    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+    with this program; if not, see <https://www.gnu.org/licenses/>.
 
 Also add information on how to contact you by electronic and paper mail.
 
@@ -329,8 +328,8 @@ necessary.  Here is a sample; alter the names:
   Yoyodyne, Inc., hereby disclaims all copyright interest in the program
   `Gnomovision' (which makes passes at compilers) written by James Hacker.
 
-  <signature of Ty Coon>, 1 April 1989
-  Ty Coon, President of Vice
+  <signature of Moe Ghoul>, 1 April 1989
+  Moe Ghoul, President of Vice
 
 This General Public License does not permit incorporating your program into
 proprietary programs.  If your program is a subroutine library, you may
-- 
2.56.0

